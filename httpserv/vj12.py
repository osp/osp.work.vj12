# -*- coding: utf-8 -*-

"""
This is the main script for vj12 publication websites.  It runs on bottle, a
micro framework written in python. See <http://bottlepy.org/>.
"""


from __future__ import division


import bottle
import nltk
import os
import re

import codecs
from glob import glob
from string import replace
from bottle import (run, get, request, response, template, route, static_file)
from glob import glob
from json import dumps
from nltk.corpus import PlaintextCorpusReader
from string import replace
import random


PROJECT_DIR = os.path.abspath(os.path.dirname(__file__))
CORPUS_ROOT = os.path.join(PROJECT_DIR, 'texts')
STATIC_DIR = os.path.join(PROJECT_DIR, '..', 'static')

def pick_ascii():
    fn = random.choice(["ascii.tpl", "ascii2.tpl", "ascii3.tpl", "ascii4.tpl", "ascii5.tpl"])
    f = open("templates/ascii/%s" % fn, "r") 
    background = f.read()
    f.close()
    return background

@route('/')
def home():
    return template('templates/home', background = pick_ascii())


@route('/about/')
def about():
    return template('templates/about', background = pick_ascii())


@route('/kaleidosmatch/')
def kaleidosmatch():
    return template('templates/kaleidosmatch', background = pick_ascii())

@route('/fit_the_annual_report_for_purpose/')
def fit_the_annual_report_for_purpose():
    return template('templates/fit_the_annual_report_for_purpose', background=pick_ascii())

@route('/macro/')
def macro():
    return template('templates/macro', background=pick_ascii())

@route('/micromacro/')
def micromacro():
    return template('templates/micro', background = pick_ascii())

@route('/moss_ambiguity/')
def moss_ambiguity():
    return template('templates/moss_ambiguity', background = pick_ascii())


# BELOW: EXPERIMENTS


@route('/context')
@route('/context/:filename/:word')
def context(filename = False, word = False):
    """
    An interface to look at permutated indices.
    """
    if word and re.match ("^[a-zA-Z0-9_\(\),\.]+$", filename) and re.match ("^[a-zA-Z0-9_]+$", word):
        handler = codecs.open ("texts/%s.txt" % filename, "r", "utf-8")
        found_lines = []
        head_length = 0
        
        for line in handler:
            pattern = "(?P<head>^|^\W+|(\w+\W+){1,4})(?P<body>%s)(?P<tail>(\W+\w+){1,4}|\W+$|$)" % word
            match = re.search (pattern, line);
            while match:
                head_length = len (match.group ('head')) if len(match.group ('head')) > head_length else head_length
                found_lines.append ({'head': match.group ('head'), 'body': match.group ('body'), 'tail': match.group ('tail')})
                line = line[match.end('body'):]
                match = re.search (pattern, line)
        
        for x, line in enumerate(found_lines):
            found_lines[x]['head'] = found_lines[x]['head'].rjust (head_length, ' ')
            found_lines[x]['full_line'] = ''.join (line)
            
    return dumps ({'filename': filename, 'word': word, 'result': found_lines})


@route('/compare/')
def compare():
    return template ('templates/compare', background = pick_ascii())

@route('/view/')
def view():
    return template('templates/view')
    
@route('/text/pair_list/')
def pairList ():
    return dumps (['Fit_for_purpose|The_man_pages', 'To_talk_of_many_things|Systemic_ambiguity', 'Kaleidoscope,_a_genesis|Smatch_(1)'])
    
@route('/text/list/')
def textlist ():
    """
    Generates a a javascript array of the available texts filename.
    """
    files = []
    for filename in glob(os.path.join(CORPUS_ROOT, '*.txt')):
        name = os.path.basename(filename)
        (basename, extension) = os.path.splitext(name)
        files.append(basename)

    return dumps (files)
        
@route('/text/:filename')
def text(filename):
    """
    Returns a json dictionnary containing:
    
    - data: the content of the file "filename"
    - name: the name of the text, deduced form the file name
    """
    path = 'texts/'
    filename = os.path.join(CORPUS_ROOT, "%s.txt" % filename)
    name = os.path.basename(filename)
    (basename, extension) = os.path.splitext(name)
    file_dict = {'name': basename, 'data': None}
    
    f = open(filename, 'r')
    file_dict['data'] = f.read()
    f.closed
    
    return dumps(file_dict)

@route('/js')
def js():
    return static_file ('jquery.min.js', 'js/')
    
@route('/collocations/:text/')
def collocations(text):
    text = '%s.txt' % text
    corpus = PlaintextCorpusReader(CORPUS_ROOT, [text])
    n_text = nltk.text.Text(corpus.words(text))

    bigram_measures = nltk.collocations.BigramAssocMeasures()

    # Finds bigrams
    from nltk.collocations import BigramCollocationFinder
    
    finder = BigramCollocationFinder.from_words(n_text)
    ignored_words = nltk.corpus.stopwords.words('english')
    finder.apply_word_filter(lambda w: len(w) < 3 or w.lower() in ignored_words)
    bigrams = finder.nbest(bigram_measures.likelihood_ratio, 20)

    #return template('templates/split', text=source, word_list=foo)
    return dumps ({'name': text, 'bigrams': bigrams})

@route('/similar/:text/:word/')
def similar (text, word):
    if re.match ("^[a-zA-Z0-9_\(\),\.]+$", text) and re.match ("^[a-zA-Z0-9_]+$", word):
        text = '%s.txt' % text
        
        f = open(os.path.join(CORPUS_ROOT, text), 'r')
        source = f.read()
        f.close()
        
        corpus = PlaintextCorpusReader(CORPUS_ROOT, [text])
        n_text = nltk.text.Text(corpus.words(text))
        context_index = nltk.text.ContextIndex(n_text.tokens, filter=lambda x:x.isalpha(), key=lambda s:s.lower())
        word = word.lower()
        wci = context_index._word_to_contexts
        result = []
        
        if word in wci.conditions():
            contexts = set(wci[word])
            fd = nltk.probability.FreqDist(w for w in wci.conditions() for c in wci[w] if c in contexts and not w == word)
            words = nltk.util.tokenwrap(fd.keys()[:20])
            
            for middle_word in words.split(' '):
                for context in contexts:
                    if re.search ("/" + context[0] + "(\W|\s)+" + middle_word + "(\W|\s)+" + context[1] + "/i", source) != 'none':
                        print (context[0], middle_word, context[1])
                        result.append ({'word': word, 'context_left': context[0], 'context_right': context[1]})
            
        return dumps ({'name': text, 'word': word, 'result': result})    
    
@route('/word_list/:text')
def word_list(text):
    """Returns an alphabetical list of words for the given text."""
    corpus = PlaintextCorpusReader(CORPUS_ROOT, [text])
    n_text = nltk.text.Text(corpus.words(text))

    f = open(os.path.join(CORPUS_ROOT, text), 'r')
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
    f = open(os.path.join(CORPUS_ROOT, text), 'r')
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

    return template('templates/split', text=source, word_list=foo)


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

@route('/concordance/:text')
def concordance(text):
    """Returns an alphabetical list of words for the given text."""
    corpus = PlaintextCorpusReader(CORPUS_ROOT, [text])
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
    return template('templates/split', word_list=word_list, text=text)


@route('/static/<filename:path>')
def send_static(filename):
    # NOTE: route filers neccesitate bottle >= 0.10.
    return static_file(filename, root=STATIC_DIR)


if __name__ == '__main__':
    bottle.debug(True)
    run(host='localhost', port=8080)
