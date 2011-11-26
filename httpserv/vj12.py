# -*- coding: utf-8 -*-
from __future__ import division
import urllib2
import bottle
import os
import re
from glob import glob
from string import replace
from bottle import (run, get, request, response, template, route, static_file)
from json import dumps
import os
import nltk
from nltk.corpus import PlaintextCorpusReader
import re

bottle.debug(True)

@get('/proxy/')
def proxy():
    url = request.GET.get('url')
    response = urllib2.urlopen(url)
    return response.read()

@get('/')
def home():
    return template('hello')

@route('/context')
@route('/context/:filename/:word')
def context(filename = False, word = False):
    ptx = ''
    if word and re.match ("^[a-zA-Z0-9_]+$", filename) and re.match ("^[a-zA-Z0-9_]+$", word):
        import os
        cmd = 'ptx --word-regexp=\ {0!s}\  texts/{1!s}.txt'.format (word, filename)
        lines = os.popen(cmd)
        ptx = lines.read()
    return dumps ({'filename': filename, 'word': word, 'result': ptx})

#@route('/overview')
#def overview():
#    return template('overview',files = '["the-man-pages", "to-talk-of-many-things"]')

@route('/view')
def view():
    return template ('view')
    
@route('/text/list')
def textlist ():
    path = 'texts/'
    files = []
    for filename in glob(os.path.join(path, '*.txt')):
        files.append (filename[len(path):len(filename) - 4])
    
    return dumps (files)
        
@route('/text/:filename')
def text(filename):
    path = 'texts/'
    filename = path + '%s.txt' % filename.replace ('-', '_')
    file = {'name': filename[len(path):len(filename) - 4].replace ('_', ' '), 'data': None}
    
    with open (filename, 'r') as f:
        file['data'] = f.read()
    f.closed
    
    return dumps (file)
    
@route('/collocations/:text')
def collocations(text):
    corpus_root = os.path.abspath(os.path.dirname(__file__))
    corpus = PlaintextCorpusReader(corpus_root, [text])
    n_text = nltk.text.Text(corpus.words(text))

    bigram_measures = nltk.collocations.BigramAssocMeasures()
    trigram_measures = nltk.collocations.TrigramAssocMeasures()

    # Finds bigrams
    from nltk.collocations import BigramCollocationFinder, TrigramCollocationFinder
    finder = BigramCollocationFinder.from_words(n_text)
    finder.apply_freq_filter(3)
    foo = finder.nbest(bigram_measures.pmi, 20)

    finder = BigramCollocationFinder.from_words(n_text)
    ignored_words = nltk.corpus.stopwords.words('english')
    finder.apply_word_filter(lambda w: len(w) < 3 or w.lower() in ignored_words)
    foo = finder.nbest(bigram_measures.likelihood_ratio, 20)

    ## Trigrams are less interesting...
    #finder = TrigramCollocationFinder.from_words(n_text)
    #ignored_words = nltk.corpus.stopwords.words('english')
    #finder.apply_word_filter(lambda w: len(w) < 3 or w.lower() in ignored_words)
    #foo = finder.nbest(trigram_measures.likelihood_ratio, 30)

    #word_fd = nltk.FreqDist(n_text)
    #bigram_fd = nltk.FreqDist(nltk.bigrams(n_text))
    #finder = BigramCollocationFinder(word_fd, bigram_fd)
    #ignored_words = nltk.corpus.stopwords.words('english')
    #finder.apply_word_filter(lambda w: len(w) < 4 or w.lower() in ignored_words)
    #scored = finder.score_ngrams(bigram_measures.raw_freq)
    #foo = sorted(finder.nbest(trigram_measures.raw_freq, 10))

    f = open(os.path.join(corpus_root, text), 'r')
    source = f.read()
    f.close()

    #foo = n_text.collocations()

    return template('split', text=source, word_list=foo)

@route('/word_list/:text')
def word_list(text):
    """Returns an alphabetical list of words for the given text."""
    corpus_root = os.path.abspath(os.path.dirname(__file__))
    corpus = PlaintextCorpusReader(corpus_root, [text])
    n_text = nltk.text.Text(corpus.words(text))

    f = open(os.path.join(corpus_root, text), 'r')
    source = f.read()
    f.close()

    # TODO: use NLTK built-in functions for this!
    word_list = sorted(set(map(str.lower, n_text)))
    word_list = sorted(set(w.lower() for w in n_text if w.isalpha()))

    # How many words are used? (includes punctuation and stop words)
    token_count = len(word_list)

    token_usage_average = len(map(str.lower, n_text)) / len(set(map(str.lower, n_text)))

    # How many times the word the appears?
    the_word_count = n_text.count("the")
    print(the_word_count)
    
    # What is the coverage in pourcents of the word "the" in the text?
    the_word_coverage = 100 * n_text.count('the') / len(n_text)
    print(the_word_coverage)

    # What are the 50 most used words 
    frequency_distribution = nltk.probability.FreqDist(n_text)
    print(frequency_distribution.keys()[:50])

    # Prints every single word and how many times it appears
    for (word, count) in frequency_distribution.iteritems():
        print(word, count)

    # How many times the word "digital" appears?
    print(frequency_distribution['digital'])

    # Plots the frequency of the 50 most used words
    #frequency_distribution.plot(50, cumulative=True)

    # Find words with more than 10 letters
    long_words = [w for w in n_text if len(w) > 10]
    print(long_words)

    # Find words with more than 10 letters appearing more than 3 times
    common_long_words = sorted([w for w in n_text if len(w) > 10 and frequency_distribution[w] > 3])
    print(common_long_words)

    # What are the bigrams (words appearing often in pairs, eg. "red wine")
    # NOTE: not very useful yet as we want to find "rare words"
    text_bigrams = nltk.util.bigrams(n_text)
    print(text_bigrams)

    # Distribution of word length in the text
    fdist = nltk.probability.FreqDist([len(w) for w in n_text])
    print(fdist.keys())

    # What is the longest word in the text
    print(max(fdist))

    # What is the occurence of 3 letters words?
    print(fdist.freq(3))

    print(fdist.tabulate())

    # What are the unusual words?
    def unusual_words(text):
        text_vocab = set(w.lower() for w in text if w.isalpha())
        english_vocab = set(w.lower() for w in nltk.corpus.words.words())
        unusual = text_vocab.difference(english_vocab)
        return sorted(unusual)
    print(unusual_words(n_text))

    # non-stop words
    def non_stop_words(text):
        text_vocab = set(w.lower() for w in text if w.isalpha())
        english_vocab = set(w.lower() for w in nltk.corpus.stopwords.words('english'))
        non_stop = text_vocab.difference(english_vocab)
        return sorted(non_stop)
    print(non_stop_words(word_list))

    # Prints all the words finishing by ed
    ed_words = [w for w in non_stop_words(word_list) if re.search('ed$', w)]
    print(ed_words)

    # Prints all the words finishing by ing
    ing_words = [w for w in non_stop_words(word_list) if re.search('ing$', w)]
    print(ing_words)

    # Prints all the words finishing by ed or ing
    ed_or_ing_words = [w for w in non_stop_words(word_list) if re.search('(ing|ed)$', w)]
    print(ed_or_ing_words)

    # Prints all numbers
    numbers = [w for w in non_stop_words(word_list) if re.search('[0-9]+', w)]
    print(numbers)


    # Removes suffixes to find unique lemmas
    # eg. laptop(s)
    # FIXME: returns non-existing words
    # TODO: use NLTK built-in function instead
    def stem(word):
        regexp = r'^(.*?)(ing|ly|ed|ious|ies|ive|es|s|ment)?$'
        stem, suffix = re.findall(regexp, word)[0]
        return stem
    stems = [stem(t) for t in non_stop_words(word_list)]
    print(stems)

    # Tokenizes the text
    # NOTE: what's the difference between this method and the way n_text is produced?
    f = open(text, 'r')
    tokens = nltk.word_tokenize(f.read())
    f.close()
    print(tokens)


    porter = nltk.PorterStemmer()
    grail = nltk.corpus.webtext.words('grail.txt')
    text = IndexedText(porter, grail)
    text.concordance('lie')


    wnl = nltk.WordNetLemmatizer()
    print([wnl.lemmatize(t) for t in tokens])


    
    #word_list = "<br />".join(non_stop_words(word_list))
    foo = ""
    for word in non_stop_words(word_list):
        foo += "<a href='#'>"
        foo += word
        foo += "</a><br />"

    return template('split', text=source, word_list=foo)


class IndexedText(object):
    def __init__(self, stemmer, text):
        self._text = text
        self._stemmer = stemmer
        self._index = nltk.Index((self._stem(word), i)
                                 for (i, word) in enumerate(text))

    def concordance(self, word, width=40):
        key = self._stem(word)
        wc = int(width / 4)                # words of context
        for i in self._index[key]:
            lcontext = ' '.join(self._text[i - wc:i])
            rcontext = ' '.join(self._text[i:i + wc])
            ldisplay = '%*s'  % (width, lcontext[-width:])
            rdisplay = '%-*s' % (width, rcontext[:width])
            print ldisplay, rdisplay

    def _stem(self, word):
        return self._stemmer.stem(word).lower()

@route('/img/:filename')
def img (filename):
    return static_file (filename, root='img')

@route('/concordance/:text')
def concordance(text):
    """Returns an alphabetical list of words for the given text."""
    corpus_root = os.path.abspath(os.path.dirname(__file__))
    corpus = PlaintextCorpusReader(corpus_root, [text])
    n_text = nltk.text.Text(corpus.words(text))
    interesting = [
            'data',
            'grey',
            'literature',
            'relation',
            'user',
            'information',
            'error',
            'value',
            'other',
            ]
    # TODO: use NLTK built-in functions for this!
    word_list = map(str.lower, list(set(list(corpus.words()))))
    word_list.sort()
    #word_list = "<br />".join(word_list)
    return template('split', word_list=word_list)

# NOTE: route filers neccesitate bottle >= 0.10.
@route('/static/<filename:path>')
def send_static(filename):
    print(filename)
    return static_file(filename, root='/home/aleray/work/vj12/static')

#@route('/static/<filepath>')
#def server_static(filepath):
    #root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'static'))
    #print(root)
    #return static_file(filepath, root=root)

run(host='localhost', port=8080)
