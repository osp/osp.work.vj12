%def extrahead():
        <style>
            @font-face {
                font-family: 'ConsolaMonoBook';
                src: url('/static/css/fonts/consola/consolamono-webfont.eot');
                src: url('/static/css/fonts/consola/consolamono-webfont.eot?#iefix') format('embedded-opentype'),
                    url('/static/css/fonts/consola/consolamono-webfont.woff') format('woff'),
                    url('/static/css/fonts/consola/consolamono-webfont.ttf') format('truetype'),
                    url('/static/css/fonts/consola/consolamono-webfont.svg#ConsolaMonoBook') format('svg');
                font-weight: normal;
                font-style: normal;
            }
            @font-face {
                font-family: 'LiberationMonoRegular';
                src: url('fonts/liberation/LiberationMono-Regular-webfont.eot');
                src: url('fonts/liberation/LiberationMono-Regular-webfont.eot?#iefix') format('embedded-opentype'),
                    url('fonts/liberation/LiberationMono-Regular-webfont.woff') format('woff'),
                    url('fonts/liberation/LiberationMono-Regular-webfont.ttf') format('truetype'),
                    url('fonts/liberation/LiberationMono-Regular-webfont.svg#LiberationMonoRegular') format('svg');
                font-weight: normal;
                font-style: normal;
            }
            .line {
                padding: 10px 0 7px 0;
                display: block;
                width: 100%;
                border-bottom: 1px solid #efefef;
                vertical-align: text-top;
            }
            .username, .timecode, .message, .message.ivan {
                margin: 0;
                padding: 0;
                display: inline-block;
                vertical-align: text-top;
            }
            .username, span.timecode {
                width: 18%;
            }
            .timecode {
                margin-right: -18%;
                font-family: "ConsolaMonoBook";
                font-size: 12px;
            }
            .username {
                margin-left: 18%;
                margin-right: -36%;
                text-transform: uppercase;
            }
            .ivan {
                color: Gray;
            }
            .message, .message.ivan {
                margin-left: 36%;
                width: 60%;
            }
            .message.ivan, .username.ivan {
                line-height: 1.5;
            }
            div#container h1, div#container h2, div#container h3, div#container h4, div#container h5, div#container h5 {
                margin-left: 18%;
                font-family: "Consola Mono";
                text-transform: uppercase;
            }
            div#container h1 {
                font-size: 40px;
                margin-top: 100px;
            }
            div#container h2 {
                margin-top: 40px;
            }
            div#container h4 {
                margin: 10px 0 5px 36%;
                font-size: 16px;
            }
            div#container h5 {
                margin-top: 15px;
                margin-bottom: 10px;
                font-size: 14px;
            }
            div#container p {
                margin: 0;
            }
            div#container p, .message {
                font-family: "Linux Libertine";
            }
            .header.ivan {
                display: inline-block;
                margin-left: 50px;
            }
            .system_message {
                font-family: NotCourierSans, Courier, Monospace; 
                margin-left: 36%;
                color: #999;
            }
            div#container {
                background-color: white;
                height: auto;
            }
            p.didascalie {
                font-style: italic;
                margin-left: 18%;
            }
        </style>
%end


%rebase templates/base background=background, extrahead=extrahead, title='Fit the Annual Report for Purpose', oneliner='A conversation between Ivan Monroy Lopez\'s <a href="http://constantvzw.org/verlag/spip.php?page=article&id_article=123&mot_filtre=5&id_lang=0" target="_blank">Soap Box Annual Report</a> and <a href="http://constantvzw.org/verlag/spip.php?page=article&id_article=121&mot_filtre=5&id_lang=0" target="_blank">Fit for Purpose</a> filtered by Donatella Portoghese.'

    <div id="container">
        <h1>Fit <span class="header ivan">the annual report</span><br /> for purpose</h1>
        <p class="didascalie">
            A software testers day in 3 acts :<br />
            10 deploys, 10 bugs and the team
        </p>
        <p class="didascalie">
            Fit for purpose is a principle included in Quality Assurance.<br />
            The product should be suitable for the intended purpose.<br />
            Quality is determined by the product user.
        </p>

        <h2>I ACT</h2>

        <h3>A day in 10 deployments</h3>

        <h4>Loops </h4>

        <h5>Deploy 1</h5>
        <p>
            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                '\"&nbsp;t<br />
                .\"<br />
                .\"&nbsp;You&nbsp;may&nbsp;distribute&nbsp;under&nbsp;the&nbsp;terms&nbsp;of&nbsp;the&nbsp;GNU&nbsp;General&nbsp;Public<br />
                .\"&nbsp;License&nbsp;as&nbsp;specified&nbsp;in&nbsp;the&nbsp;file&nbsp;COPYING&nbsp;that&nbsp;comes&nbsp;with&nbsp;the<br />
                .\"&nbsp;man-db&nbsp;distribution.<br />
                .\"<br />
                .\"&nbsp;Sat&nbsp;Nov&nbsp;27<br />
                .\"<br />
                .pc<br />
                .TH&nbsp;print&nbsp;soapbox&nbsp;"2009-11-28"&nbsp;"1.0"&nbsp;"print"<br />
                .SH&nbsp;manuals,&nbsp;man&nbsp;pages<br />
                .I&nbsp;according&nbsp;to&nbsp;the&nbsp;mmm,&nbsp;software&nbsp;has&nbsp;two&nbsp;faces,&nbsp;both&nbsp;as&nbsp;important.&nbsp;the&nbsp;code<br />
                .I&nbsp;speaks&nbsp;to&nbsp;the&nbsp;machine,&nbsp;and&nbsp;the&nbsp;documentation&nbsp;``tells&nbsp;its&nbsp;story&nbsp;to&nbsp;the&nbsp;human<br />
                .I&nbsp;user.''
            </span>
        </p>
        <p>
            <span class="line"><span class="username">Andy:</span><span class="message">morning qa people.  I am going to start a full qa deployment in a couple of minutes i'll start with the data base backups backups started... qa environments going offline in 10 minutes starting data base restore... qa environment is offline. I will give progress updates here Data base 3/4 started. code starting Code deploy finished. Data base 4/4 , it is 30 Qa environment online. give a couple of mins for first page load.</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">yo</span></span>
            <span class="line"><span class="username">John:</span><span class="message">Good morning!</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">hi guys</span></span>
        </p>
        <h5>Deploy 2</h5>
        <p>
        <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
            The&nbsp;following&nbsp;is&nbsp;also&nbsp;from&nbsp;the&nbsp;fanzine&nbsp;I'm&nbsp;talking&nbsp;about.&nbsp;It's&nbsp;a&nbsp;perhaps<br />
            convoluted&nbsp;way&nbsp;of&nbsp;saying&nbsp;that&nbsp;there's&nbsp;a&nbsp;difference&nbsp;between&nbsp;the&nbsp;documents&nbsp;that<br />
            keep&nbsp;track&nbsp;of&nbsp;the&nbsp;changes&nbsp;in&nbsp;a&nbsp;piece&nbsp;of&nbsp;software&nbsp;over&nbsp;time,&nbsp;and&nbsp;the&nbsp;documents<br />
            that&nbsp;show&nbsp;how&nbsp;a&nbsp;piece&nbsp;of&nbsp;software&nbsp;is&nbsp;used,&nbsp;even&nbsp;if&nbsp;they&nbsp;sometimes&nbsp;get&nbsp;lumped<br />
            together.&nbsp;Texinfo&nbsp;is&nbsp;just&nbsp;another&nbsp;documentation&nbsp;format&nbsp;that&nbsp;some&nbsp;people&nbsp;seem<br />
            to&nbsp;prefer.</span></span>
        </p>
        <p>
            <span class="line"><span class="username">Andy:</span><span class="message">okay good to go</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">@Mark: You ok for a code deploy to QA ?</span></span>
            <span class="line"><span class="username">Mark:</span><span class="message">code deploy finished. Data base 4/4 , it is 30%</span></span>
            <span class="line"><span class="username">Claudia:</span><span class="message">@micheal just a sec Colin needs to check it in</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">ok</span></span>
            <span class="line"><span class="message">QA server coming down now</span></span>
            <span class="line"><span class="message">and we're back</span></span>
            <span class="line"><span class="username">Claudia:</span><span class="message">getting 500 here :(</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">argh</span></span>
            <span class="line"><span class="message">John??</span></span>
            <span class="line"><span class="username">Claudia:</span><span class="message">Is someone doing the deploy for QA? Pls</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">it's done, but we need John's input</span></span>
            <span class="line"><span class="message">as for whatever reason it build but doesn't work</span></span>
            <span class="line"><span class="username">Claudia:</span><span class="message">oh understood.... he is in this chat. ((wave)) Hi John!</span></span>
        </p>
        <h5>Deploy 3</h5>
        <p>
            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                .I&nbsp;in&nbsp;the&nbsp;gnu&nbsp;coding&nbsp;standards,&nbsp;the&nbsp;terms&nbsp;documentation&nbsp;and&nbsp;manual&nbsp;practically<br />
                .I&nbsp;mean&nbsp;the&nbsp;same&nbsp;thing.&nbsp;specifically,&nbsp;a&nbsp;manual&nbsp;is&nbsp;a&nbsp;texinfo&nbsp;file,&nbsp;and<br />
                .I&nbsp;documentation&nbsp;includes&nbsp;manuals&nbsp;and&nbsp;other&nbsp;things&nbsp;like&nbsp;NEWS&nbsp;files&nbsp;and&nbsp;change<br />
                .I&nbsp;logs.&nbsp;in&nbsp;practice,&nbsp;the&nbsp;latter&nbsp;term&nbsp;practically&nbsp;takes&nbsp;the&nbsp;place&nbsp;of&nbsp;the&nbsp;former.<br />
                .I&nbsp;regarding&nbsp;unix&nbsp;man&nbsp;pages,&nbsp;gnu&nbsp;suggests&nbsp;that&nbsp;&dash;if&nbsp;adequate&nbsp;help2man&nbsp;be&nbsp;used&nbsp;to<br />
                .I&nbsp;extract&nbsp;a&nbsp;man&nbsp;page&nbsp;from&nbsp;the&nbsp;texinfo&nbsp;file.&nbsp;unlike&nbsp;man&nbsp;pages,&nbsp;gnu&nbsp;manuals&nbsp;should<br />
                .I&nbsp;have&nbsp;a&nbsp;``coherent&nbsp;topic''.&nbsp;as&nbsp;an&nbsp;example,&nbsp;the&nbsp;coding&nbsp;standards&nbsp;note&nbsp;that&nbsp;diff<br />
                .I&nbsp;and&nbsp;diff3&nbsp;are&nbsp;both&nbsp;covered&nbsp;in&nbsp;a&nbsp;single&nbsp;manual,&nbsp;whereas&nbsp;there&nbsp;are&nbsp;two&nbsp;man<br />
                .I&nbsp;pages,&nbsp;one&nbsp;for&nbsp;each&nbsp;command.</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">right. sorry i got *severly* sidetracked. Okay, i'm going to start the restore of the dbases to the qa env. Means qa goes offline for 20 mins. everyone okay for that to happen now?</span></span>
        </p>
        <h5>Deploy 4</h5>
        <p>
            <span class="line"><span class="username">Ivan:</span><span class="message ivan">
                I&nbsp;think&nbsp;that&nbsp;it's&nbsp;funny&nbsp;that&nbsp;they&nbsp;write&nbsp;implementation&nbsp;does&nbsp;not&nbsp;equal<br />
                documentation.&nbsp;I&nbsp;guess&nbsp;that&nbsp;sometimes&nbsp;it's&nbsp;hard&nbsp;to&nbsp;take&nbsp;distance:</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">i need a code deploy</span></span>
            <span class="line"><span class="message">for a change to the import-export tool</span></span>
            <span class="line"><span class="message">yay/nay?</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">yes, but do it fast</span></span>
            <span class="line"><span class="message">like real fast</span></span>
            <span class="line"><span class="message">fast like the wind</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">ok</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">you done yet?</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">no</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">:)</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">building</span></span>
            <span class="line"><span class="message">oi</span></span>
            <span class="line"><span class="message">ants in ya pants</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">yes</span></span>
            <span class="line"><span class="username">John:</span><span class="message">you QA people are funny</span></span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">eccentricity is the way we cope with cockups</span></span></span>
            <span class="line"><span class="message">which are our lifeblood</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">you english QA ppl are funny</span></span></span>
            <span class="line"><span class="message">like funny in the head</span></span>
        </p>
        <h4>loops</h4>
        </p>
        <h5>Deploy 5</h5>
        <p>
            <span class="line"><span class="username">John:</span><span class="message">we have a build update to QA we would like to do</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">rightio...</span></span>
            <span class="line"><span class="username">John:</span><span class="message">no additional bug fixes included</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">code + dbase?</span></span>
            <span class="line"><span class="username">John:</span><span class="message">but, we have updated the client side caching expiry times</span></span>
            <span class="line"><span class="message">just code</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">okay</span></span>
            <span class="line"><span class="username">John:</span><span class="message">after talking to ebm</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">i can do that</span></span>
            <span class="line"><span class="username">John:</span><span class="message">so, just tag build deploy please</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">rightio</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">if you need any content copying from A to B let me know from where to where</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">i'll take that action</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">and for which locale</span></span>
            <span class="line"><span class="username">John:</span><span class="message">thank you</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">qa env is up</span></span>
        </p>
        <h5>Deploy 6</h5>
        <p>
            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                .I&nbsp;the&nbsp;people&nbsp;of&nbsp;gnu&nbsp;distinguish&nbsp;between&nbsp;the&nbsp;way&nbsp;in&nbsp;which&nbsp;a&nbsp;program&nbsp;was&nbsp;built,<br />
                .I&nbsp;and&nbsp;the&nbsp;way&nbsp;in&nbsp;which&nbsp;it's&nbsp;used.&nbsp;they&nbsp;warn&nbsp;about&nbsp;modelling&nbsp;the&nbsp;documentation<br />
                .I&nbsp;after&nbsp;the&nbsp;software:</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">starting a deployment</span></span>
            <span class="line"><span class="message">qa env will go offline in 10 mins</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">code or data too</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">both</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">ok have you started the data backup yet?</span></span>
            <span class="line"><span class="message">I can wait till it's done and repeat after</span></span>
            <span class="line"><span class="message">no biggie</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">till started already yom kippur</span></span>
            <span class="line"><span class="message">or, yonder kipper, as we say to the youth of today</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">np</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">do you know what a yonder kipper is?</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">no, a far-away kipper?</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">heh :) good guess</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">"what light through yonder kipper breaks"</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">nice. that's quite poetic.</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">it's from Romeo and Kippliet</span></span>
            <span class="line"><span class="message">hmm just remembered, if I update the Integ CMS and it's being backed up, it will not break the backup, will it?</span></span>
            <span class="line"><span class="message">so i can do my edit now...</span></span>
            <span class="line"><span class="message">btw someone on integ was testing timed publish, and hasn't reverted it, that's why Products is showing a warning</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">nah not at all</span></span>
            <span class="line"><span class="message">go right ahead and keep editing</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">ok there were not changes required on integ for integ domains</span></span>
            <span class="line"><span class="message">the asia fonts are not yet available on .qa domains</span></span>
            <span class="line"><span class="message">well, not Vietnamese or Thai</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">that will be a problem for claudia to test them</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">ok the values will be in the next QA DB deploy</span></span>
            <span class="line"><span class="message">they're fine now for QA</span></span>
        </p>
        <h4>loops</h4>
        <h5>Redeploy</h5>
        <p>
            <span class="line"><span class="username">John:</span><span class="message">Redeploying the build</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">Last night I did a deploy  if that is anything to go by</span></span>
            <span class="line"><span class="username">John:</span><span class="message">I'm retagging  the build</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">Yesterday we had 2 or 3 breakages which I got Topher to fix as they were related to shortURLs</span></span>
            <span class="line"><span class="username">John:</span><span class="message">make that 4</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">joy</span></span>
            <span class="line"><span class="username">John:</span><span class="message">I just fixed it though waiting for server to load up</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">Topher thought he removed the shortURL functionality but evidently did not</span></span>
            <span class="line"><span class="username">John:</span><span class="message">That wasn't it</span></span>
            <span class="line"><span class="message">QA is back up</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">yay</span></span>
            <span class="line"><span class="message">tnx</span></span>
            <span class="line"><span class="username">Mark:</span><span class="message">tnx !</span></span>
            <span class="line"><span class="username">John:</span><span class="message">Sorry for the breakage</span></span>
        </p>
        <h5>Deploy 7</h5>
        <p>
            <span class="line"><span class="username">Andy:</span><span class="message">Data base backups starting</span></span>
            <span class="line"><span class="message">qa environment offline in 10 mins</span></span>
            <span class="line"><span class="message">qa environment going offline</span></span>
            <span class="line"><span class="message">qa environment is up</span></span>
            <span class="line"><span class="message">give a few mins for first page load</span></span>
            <span class="line"><span class="message">give me a few mins</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">oo isn't this exciting</span></span>
            <span class="line"><span class="message">will it work, won't it work, you decide</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">all good, kids</span></span>
            <span class="line"><span class="message">i had a typo in a database name</span></span>
            <span class="line"><span class="message">it's up</span></span>
            <span class="line"><span class="message">enjoy...  tell your friends.</span></span>
        </p>
        <h5>Deploy 8</h5>
        <p>
            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                .B&nbsp;programmers&nbsp;tend&nbsp;to&nbsp;carry&nbsp;over&nbsp;the&nbsp;structure&nbsp;of&nbsp;the&nbsp;program&nbsp;as&nbsp;the<br />
                .B&nbsp;structure&nbsp;for&nbsp;its&nbsp;documentation.&nbsp;but&nbsp;this&nbsp;structure&nbsp;is&nbsp;not&nbsp;necessarily<br />
                .B&nbsp;good&nbsp;for&nbsp;explaining&nbsp;how&nbsp;to&nbsp;use&nbsp;the&nbsp;program&nbsp;[...]&nbsp;learn&nbsp;to&nbsp;notice&nbsp;when<br />
                .B&nbsp;you&nbsp;have&nbsp;unthinkingly&nbsp;structured&nbsp;the&nbsp;documentation&nbsp;like&nbsp;the<br />
                .B&nbsp;implementation,&nbsp;stop&nbsp;yourself,&nbsp;and&nbsp;look&nbsp;for&nbsp;better&nbsp;alternatives.</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">qa environment will go offline in a few mins for a few mins</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">any news on the env?</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">yeah sorry...  a couple more minutes.  I fucked up and deployed it wrong :)</span></span>
            <span class="line"><span class="message">I have to do the actual deploy that bit again</span></span>
            <span class="line"><span class="message">go go go</span></span>
            <span class="line"><span class="message">qa environment is up</span></span>
            <span class="line"><span class="message">Integral database backup started. ~10 mins till qa goes offline</span></span>
        </p>
        <h5>Deploy 9</h5>
        <p>
            <span class="line"><span class="username">Andy:</span><span class="message">qa environment going offline for deploy and data base restore</span></span>
            <span class="line"><span class="message">Data base 3/4 started. code deploy starting. qa environment online in 20 mins</span></span>
            <span class="line"><span class="message">It's for IE6 browser detection</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">do we need a new deploy for that?  it's a CR</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">no it's all done from a qa perspective as far as i understand,  all there that needs to be.</span></span>
            <span class="line"><span class="message">sorry... I misunderstood tudor.  he is importing some stuff into qa env for us to enable the browser detection to work.  He is working on it now, but it's not ready.  I'll notify when that's done</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">importing stuff...  back from prodn to integ then to QA</span></span>
        </p>
        <h5>Deploy 10</h5>
        <p>
            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                .I&nbsp;the&nbsp;coding&nbsp;standards&nbsp;advise&nbsp;authors&nbsp;to&nbsp;approach&nbsp;users&nbsp;pedagogically,&nbsp;thinking<br&nbsp;/>
                .I&nbsp;about&nbsp;``the&nbsp;concepts&nbsp;and&nbsp;questions&nbsp;that&nbsp;a&nbsp;user&nbsp;will&nbsp;have&nbsp;in&nbsp;mind&nbsp;when&nbsp;reading<br&nbsp;/>
                .I&nbsp;it.''&nbsp;what's&nbsp;more,&nbsp;the&nbsp;manuals&nbsp;that&nbsp;they&nbsp;write&nbsp;should&nbsp;admit&nbsp;two&nbsp;types&nbsp;of<br&nbsp;/>
                .I&nbsp;reading:&nbsp;tutorial&nbsp;and&nbsp;reference.&nbsp;it's&nbsp;interesting&nbsp;to&nbsp;note&nbsp;that&nbsp;by&nbsp;tutorial&nbsp;they<br&nbsp;/>
                .I&nbsp;mean&nbsp;something&nbsp;that&nbsp;a&nbsp;user&nbsp;may&nbsp;want&nbsp;to&nbsp;read&nbsp;straight&nbsp;through.</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">will start now with the dbase dumps</span></span>
            <span class="line"><span class="message">so 10 minutes countdown until the QA env goes offline</span></span>
            <span class="line"><span class="username">Mark:</span><span class="message">I will have to clock off for today</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">rightio, thanks for your help today Mark</span></span>
            <span class="line"><span class="message">much appreciated</span></span>
            <span class="line"><span class="message">good stuff. i'll make a note of those</span></span>
            <span class="line"><span class="message">qa env going offline</span></span>
            <span class="line"><span class="message">qa env is up</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">argh and Claudia is offline...</span></span>
            <span class="line"><span class="username">Claudia:</span><span class="message">apologies, i needed to restart</span></span>
            <span class="line"><span class="message">i dont need korea for today on 03</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">um, guys... QA is poitning to Integ</span></span>
            <span class="line"><span class="message">I am changing the connnection strings now</span></span>
            <span class="line"><span class="message">so you get the correct CMS</span></span>
            <span class="line"><span class="username">Claudia:</span><span class="message">ok</span></span>
            <span class="line"><span class="username">Michael:</span><span class="message">it's up now, it reported an error (i.e. went to Page Not Found)</span></span>
            <span class="line"><span class="message">very strange</span></span>
        </p>
        <h2>II ACT</h2>

        <h3>Software failure (real or perceived) &ndash; a day in 10 bugs</h3>
        <p class="didascalie">
            Description of the problem: <br />
            Usually, quality is constrained to such topics as correctness, completeness, security, but can also include more technical requirements as described under the ISO standard ISO/IEC 9126, such as capability, reliability, efficiency, portability, maintainability, compatibility, and Usability.
        </p>
        <h4>Walkthrough</h4>
        <p>
            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                in&nbsp;this&nbsp;essay,&nbsp;code&nbsp;is&nbsp;the&nbsp;textual&nbsp;aspect&nbsp;of&nbsp;computer&nbsp;technology&nbsp;that&nbsp;may&nbsp;be<br />
                loaded&nbsp;up&nbsp;on&nbsp;a&nbsp;text&nbsp;editor&nbsp;and&nbsp;easily&nbsp;changed.&nbsp;i'm&nbsp;consciously&nbsp;avoiding&nbsp;any<br />
                discussion&nbsp;on&nbsp;the&nbsp;subject&nbsp;of&nbsp;text&nbsp;editors&nbsp;--&nbsp;jot&nbsp;down&nbsp;your&nbsp;edits&nbsp;on&nbsp;a&nbsp;piece&nbsp;of<br />
                paper&nbsp;and&nbsp;then&nbsp;write&nbsp;them&nbsp;to&nbsp;newfile&nbsp;with&nbsp;echo.&nbsp;what's&nbsp;important&nbsp;to&nbsp;me&nbsp;is&nbsp;that<br />
                this&nbsp;be&nbsp;easily&nbsp;accomplished.&nbsp;with&nbsp;enough&nbsp;time&nbsp;and&nbsp;energy,&nbsp;anyone&nbsp;could&nbsp;write<br />
                interesting&nbsp;code.&nbsp;the&nbsp;best&nbsp;project&nbsp;would&nbsp;be&nbsp;if&nbsp;my&nbsp;grandmother&nbsp;took&nbsp;the&nbsp;time&nbsp;to<br />
                re-write&nbsp;the&nbsp;linux&nbsp;kernel&nbsp;from&nbsp;scratch,&nbsp;and&nbsp;if&nbsp;she&nbsp;kept&nbsp;a&nbsp;record&nbsp;of&nbsp;her<br />
                reflections&nbsp;about&nbsp;code.&nbsp;as&nbsp;much&nbsp;as&nbsp;i&nbsp;like&nbsp;pierre&nbsp;menard,&nbsp;this&nbsp;is&nbsp;not&nbsp;feasible.<br />
                the&nbsp;processes&nbsp;of&nbsp;code&nbsp;should&nbsp;be&nbsp;manageable&nbsp;without&nbsp;the&nbsp;need&nbsp;of&nbsp;resorting&nbsp;to<br />
                too&nbsp;much&nbsp;external&nbsp;technical&nbsp;support.&nbsp;this&nbsp;means&nbsp;that&nbsp;code&nbsp;is&nbsp;relative.&nbsp;what's<br />
                code&nbsp;for&nbsp;some&nbsp;will&nbsp;not&nbsp;be&nbsp;code&nbsp;for&nbsp;others.</span></span>
            <span class="line"><span class="username">John:</span><span class="message">go there</span></span>
            <span class="line"><span class="message">then click on the ribbon, and choose publish</span></span>
            <span class="line"><span class="message">then choose change</span></span>
            <span class="line"><span class="message">check, publishable</span></span>
            <span class="line"><span class="message">then save the item</span></span>
            <span class="line"><span class="message">then preview again</span></span>
            <span class="line"><span class="username">Mark:</span><span class="message">"click on the ribbon" what ribbon would that be?</span></span>
            <span class="line"><span class="username">John:</span><span class="message">along the top</span></span>
            <span class="line"><span class="message">the main menu</span></span>
            <span class="line"><span class="message">Home, Navigate, Review, etc, etc</span></span>
            <span class="line"><span class="username">Mark:</span><span class="message">Yeps, works now. I can see the extra tab.. it looks horrible though :)</span></span>
            <span class="line"><span class="message">Something is wrong with the flash module</span></span>
            <span class="line"><span class="message">Mark checks if we are using the right one there</span></span>
            <span class="line"><span class="username">John:</span><span class="message">looks good to me</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">i'll be concerned if it's not the right one</span></span>
            <span class="line"><span class="username">John:</span><span class="message">clear cache</span></span>
            <span class="line"><span class="message">the links are pointing to the right flash version</span></span>
            <span class="line"><span class="message">just checked</span></span>
            <span class="line"><span class="username">Andy:</span><span class="message">okay, cool</span></span>
        </p>
        <h5>Bug 1</h5>
        <p class="didascalie">
            Sources of system failure
        </p>
        <p>
            <span class="line"><span class="timecode">[12:38:49]</span><span class="username">Mark:</span><span class="message">Actually, the bug they mention: o   If completed once and then send to other friends it does not react anymore after filling in the details, there is no confirmation that it has been sent, but the emails do actually go out &ntilde; the friend gets spammed with emails, because the user thinks it has not been send and tries several times</span></span>
            <span class="line"><span class="timecode">[12:39:01]</span><span class="message">Right. Other than that the issues raised are the tell a friends functionality. The text and values are a bit messed up though:"!!       Tran:Q1!! wants to share a link with you Dear friendsname,"</span></span>
            <span class="line"><span class="timecode">[13:24:39]</span><span class="message">Mark  logs the !!Tran:Q1!! finding and will reply to the mail with found WWP issues.</span></span>

            <span class="line"><span class="timecode">[13:54:50]</span></span>
        </p>
        <h5>Bug 2</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="timecode">[13:54:50]</span><span class="username">Andy:</span><span class="message">mark you need to add your comment to 40 as a defect</span></span>
            <span class="line"><span class="timecode">[13:55:02]</span><span class="message">the comment isn't something actionable by the devs just yet</span></span>
            <span class="line"><span class="timecode">[13:55:21]</span><span class="message">just copy paste that into a new defect report in that story and assign that to Lucci</span></span>
        </p>
        <h5>Bug 3</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="timecode">[13:58:53]</span><span class="username">Mark:</span><span class="message">Yeah I understand its not really a defect</span></span>
            <span class="line"><span class="timecode">[13:59:18]</span><span class="message">Its not a new thing though, and that issue has been open for quite a while</span></span>
            <span class="line"><span class="timecode">[14:00:28]</span><span class="message">will copy it to a subtask/defect</span></span>
            <span class="line"><span class="timecode">[14:06:41]</span><span class="username">Andy:</span><span class="message">you think it's not or it is?</span></span>
            <span class="line"><span class="timecode">[14:06:57]</span><span class="message">putting that string in the email looks off to me :)</span></span>
            <span class="line"><span class="timecode">[14:19:16]</span><span class="username">Mark:</span><span class="message">Hehe, it looks off.</span></span>
            <span class="line"><span class="timecode">[14:19:33]</span><span class="message">And it is a regression</span></span>
            <span class="line"><span class="timecode">[14:20:39]</span><span class="message">The 40 issue did have an open question about the email structure</span></span>
            <span class="line"><span class="timecode">[14:20:55]</span><span class="username">Andy:</span><span class="message">yeah.</span></span>
            <span class="line"><span class="timecode">[14:37:32]</span><span class="message">Good work, mark</span></span>
            <span class="line"><span class="timecode">[14:37:35]</span><span class="message">good email</span></span>
            <span class="line"><span class="timecode">[14:38:13]</span><span class="username">Mark:</span><span class="message">Thanks!</span></span>
            <span class="line"><span class="timecode">[14:38:42]</span><span class="message">Need to look into that "creating file in one locale shows up in another"</span></span>
            <span class="line"><span class="timecode">[14:38:57]</span><span class="username">Andy:</span><span class="message">yeah. that's strange</span></span>
            <span class="line"><span class="timecode">[14:39:18]</span><span class="username">John:</span><span class="message">thats been corrected</span></span>
        </p>
        <h5>Bug 4</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                when&nbsp;it&nbsp;comes&nbsp;down&nbsp;to&nbsp;it,&nbsp;this&nbsp;means&nbsp;that&nbsp;code&nbsp;is&nbsp;text&nbsp;written&nbsp;in&nbsp;one&nbsp;of&nbsp;the<br />
                computer&nbsp;languages.&nbsp;code&nbsp;is&nbsp;the&nbsp;active&nbsp;practice&nbsp;of&nbsp;altering&nbsp;half-understood<br />
                text&nbsp;files.&nbsp;code&nbsp;are&nbsp;the&nbsp;static&nbsp;characters&nbsp;that&nbsp;silently&nbsp;stare&nbsp;back&nbsp;at&nbsp;you,<br />
                and&nbsp;that&nbsp;will&nbsp;not&nbsp;even&nbsp;you&nbsp;give&nbsp;the&nbsp;illusion&nbsp;that&nbsp;you're&nbsp;double-guessing&nbsp;a<br />
                machine.&nbsp;it's&nbsp;always&nbsp;evident&nbsp;that&nbsp;someone&nbsp;else&nbsp;was&nbsp;there&nbsp;before&nbsp;you,&nbsp;and&nbsp;that<br />
                that&nbsp;person&nbsp;was&nbsp;sloppy.&nbsp;it's&nbsp;just&nbsp;a&nbsp;matter&nbsp;of&nbsp;playing&nbsp;along&nbsp;and&nbsp;locating&nbsp;those<br />
                three&nbsp;characters&nbsp;in&nbsp;a&nbsp;text&nbsp;file&nbsp;that&nbsp;will&nbsp;make&nbsp;all&nbsp;the&nbsp;difference&nbsp;on&nbsp;whether<br />
                your&nbsp;computer&nbsp;can&nbsp;display&nbsp;postscript&nbsp;or&nbsp;whether&nbsp;it&nbsp;will&nbsp;keep&nbsp;that&nbsp;as&nbsp;a&nbsp;secret<br />
                to&nbsp;itself.</span></span>
            <span class="line"><span class="timecode">[14:39:21]</span><span class="username">Andy:</span><span class="message">if that's reported from the customer i would have to see that for myself, because we dont have version problems like that with locales that i've seen</span></span>
            <span class="line"><span class="timecode">[14:39:21]</span><span class="username">John:</span><span class="message">its website settings,  in their test locale, en-IL they had no Website entry in globalization settings</span></span>
            <span class="line"><span class="timecode">[14:39:48]</span><span class="username">John:</span><span class="message">which is where the website locale is specified</span></span>
            <span class="line"><span class="timecode">[14:39:55]</span><span class="message">and when that happens, it defaults to com</span></span>
            <span class="line"><span class="timecode">[14:39:55]</span><span class="username">Andy:</span><span class="message">good catch</span></span>
            <span class="line"><span class="timecode">[14:41:59]</span><span class="username">John:</span><span class="message">Correct each country has its own files</span></span>
            <span class="line"><span class="timecode">[14:52:36]</span><span class="username">Andy:</span><span class="message">john with this explanation, i'm closing out</span></span>
            <span class="line"><span class="timecode">[14:52:47]</span><span class="message">mike,  ignore my last email,  brainfart</span></span>
        </p>
        <h5>Bug 5</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="timecode">[15:30:06]</span><span class="username">Mark:</span><span class="message">But, what is expected behaviour? Why whouldnt you be able to see files of other counties</span></span>
            <span class="line"><span class="timecode">[15:36:31]</span><span class="username">Michael:</span><span class="message">well, on the Q&A page, when you expand the answer, it "jumps" just before opening the answer completely</span></span>
            <span class="line"><span class="timecode">[15:36:47]</span><span class="message">it is smoothe opening until about 90% open, then it jumps to 100%</span></span>
            <span class="line"><span class="timecode">[15:37:03]</span><span class="message">observed in IE8</span></span>
        </p>
        <h5>Bug 6</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="timecode">[15:21:43]</span><span class="username">Claudia:</span><span class="message">hey Micheal, do you remember that issue from yesterday from the drop down menu that had a new item? This new item is not present anymore on 03. Do you know why?</span></span>
            <span class="line"><span class="timecode">[15:25:59]</span><span class="message">i see it is again pointing to obsolete</span></span>
            <span class="line"><span class="timecode">[15:26:28]</span><span class="message">it did not save the changes done yesterday ?</span></span>
            <span class="line"><span class="timecode">[15:27:37]</span><span class="username">Michael:</span><span class="message">remind me where the link is that is sending you to the Obsolete page? the homepage on the left side?</span></span>
            <span class="line"><span class="timecode">[15:28:34]</span><span class="username">Claudia:</span><span class="message">on the big teaser/home page, the thumb 7 from the top</span></span>
            <span class="line"><span class="timecode">[15:29:07]</span><span class="username">Michael:</span><span class="message">yes, but that link is correct</span></span>
            <span class="line"><span class="timecode">[15:29:11]</span><span class="message">not going to Obsolete</span></span>
            <span class="line"><span class="timecode">[15:30:08]</span><span class="message">where did the link to Obsolete appear from? Which item took you to that page?</span></span>
        </p>
        <h5>Bug 7</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="timecode">[15:52:44]</span><span class="username">Michael:</span><span class="message">this isn't the last one for today given that Ada is still working on some other bugs</span></span>
            <span class="line"><span class="timecode">[15:52:57]</span><span class="message">but I would like to get Estonia out of the way as it's trying to go live and our bug is holding it up somewhat</span></span>
            <span class="line"><span class="timecode">[15:53:27]</span><span class="username">Andy:</span><span class="message">hang on</span></span>
            <span class="line"><span class="timecode">[15:53:35]</span><span class="message">let me ask if there is stuff topher can commit</span></span>
            <span class="line"><span class="timecode">[15:55:28]</span><span class="message">go ahead. he's not ready to commit his work yet</span></span>
            <span class="line"><span class="timecode">[15:55:43]</span><span class="username">Michael:</span><span class="message">: k</span></span>
        </p>
        <h5>Bug 8</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="timecode">[16:10:38]</span><span class="username">Michael:</span><span class="message">Anyone know anything about double optin and links generated for double optin? I'd say that's a Campaign issue</span></span>
            <span class="line"><span class="timecode">[16:16:15]</span><span class="username">Mark:</span><span class="message">Is there a problem with the double optin?</span></span>
            <span class="line"><span class="timecode">[16:16:26]</span><span class="username">Michael:</span><span class="message">basically we just got a defect saying that the double opt-in URL is an invalid link</span></span>
        </p>
        <h5>Bug 9</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="timecode">[16:45:36]</span><span class="username">Andy:</span><span class="message">that's a bug</span></span>
            <span class="line"><span class="timecode">[16:45:42]</span><span class="message">file it</span></span>
            <span class="line"><span class="timecode">[16:46:09]</span><span class="message">yeah... safe bet</span></span>
            <span class="line"><span class="timecode">[16:47:12]</span><span class="username">John:</span><span class="message">so it should be in the main maintenance project</span></span>
            <span class="line"><span class="timecode">[16:47:14]</span><span class="username">Andy:</span><span class="message">yeah really? i've seen this before</span></span>
            <span class="line"><span class="timecode">[16:47:15]</span><span class="username">John:</span><span class="message">and assigned to them</span></span>
            <span class="line"><span class="timecode">[16:47:22]</span><span class="message">i think so...</span></span>
            <span class="line"><span class="timecode">[16:47:30]</span><span class="message">could be wrong though</span></span>
            <span class="line"><span class="timecode">[16:47:31]</span><span class="username">Andy:</span><span class="message">okay... so do that.</span></span>
            <span class="line"><span class="timecode">[16:47:34]</span><span class="message">assign to them</span></span>
            <span class="line"><span class="timecode">[16:47:38]</span><span class="message">let them come back to us if not</span></span>
            <span class="line"><span class="timecode">[16:47:45]</span><span class="username">John:</span><span class="message">ya</span></span>
        </p>
        <h5>Bug 10</h5>
        <p class="didascalie">
            Description of the problem: <br />
            Error, defect, failure
        </p>
        <p>
            <span class="line"><span class="timecode">[16:48:31]</span><span class="username">Mark:</span><span class="message">@Andy, so there is a bug about this already?</span></span>
            <span class="line"><span class="timecode">[16:48:40]</span><span class="username">Andy:</span><span class="message">i would say not.</span></span>
            <span class="line"><span class="timecode">[16:48:59]</span><span class="message">the double slashes i saw was for campaigns with flash modules</span></span>
            <span class="line"><span class="timecode">[16:49:06]</span><span class="message">which could be fixed by the frontend team</span></span>
            <span class="line"><span class="timecode">[16:49:09]</span><span class="message">this is not that problem</span></span>
            <span class="line"><span class="timecode">[16:49:20]</span><span class="message">so thinking about it, john's right</span></span>
            <span class="line"><span class="timecode">[16:49:34]</span><span class="username">John:</span><span class="message">nah this is the domain name redirect</span></span>
            <span class="line"><span class="timecode">[16:49:38]</span><span class="username">Andy:</span><span class="message">yeah</span></span>
        </p>

        <h2>III ACT</h2>

        <h3>The software tasting team</h3>
        <p>
            <span class="line">
                <span class="username ivan">Ivan:</span>
                <span class="message ivan">
                    my&nbsp;one&nbsp;year&nbsp;experience&nbsp;as&nbsp;a&nbsp;software&nbsp;writer&nbsp;has&nbsp;not&nbsp;been&nbsp;so&nbsp;nice,&nbsp;but&nbsp;really<br />
                    you&nbsp;should&nbsp;ask&nbsp;someone&nbsp;else&nbsp;with&nbsp;more&nbsp;experience.&nbsp;i've&nbsp;only&nbsp;worked&nbsp;a&nbsp;little&nbsp;as<br />
                    a&nbsp;freelancer&nbsp;(whatever&nbsp;that&nbsp;means)&nbsp;on&nbsp;some&nbsp;random&nbsp;websites.&nbsp;i've&nbsp;been&nbsp;learning<br />
                    on&nbsp;the&nbsp;job&nbsp;(whatever&nbsp;that&nbsp;means).
                </span>
            </span>
        </p>
        <h4>QA chat</h4>
        <p>
            <span class="line"><span class="timecode">[11:27:34]</span><span class="username">Andy:</span><span class="message">hey mike  we've just deployed to cms-test</span></span>
            <span class="line"><span class="timecode">[11:29:43]</span><span class="username">Martin:</span><span class="message">London office! Official pictures!</span></span>
            <span class="line"><span class="timecode">[11:29:54]</span><span class="username">Michael:</span><span class="message">boredom threashold exceeded?</span></span>
            <span class="line"><span class="timecode">[11:30:27]</span><span class="username">Bojan:</span><span class="message">hello guys im back again</span></span>
            <span class="line"><span class="timecode">[11:30:30]</span><span class="message">:)</span></span>
            <span class="line"><span class="timecode">[11:33:02]</span><span class="username">Andy:</span><span class="message">wb bojan.</span></span>
            <span class="line"><span class="timecode">[11:33:18]</span><span class="username">Bojan:</span><span class="message">thank you andy</span></span>
            <span class="line"><span class="timecode">[11:33:55]</span><span class="username">Andy:</span><span class="message">to remind everyone  QA chat is strictly work only. anything not directly relevant to QA should go to the casual jibber jabber chat.</span></span>
            <span class="line"><span class="timecode">[11:35:00]</span><span class="username">Bojan:</span><span class="message">ok packages and all are in place - can you guys do the magic and check if we can go live</span></span>
            <span class="line"><span class="timecode">[11:35:01]</span><span class="message">thanks!</span></span>
            <span class="line"><span class="timecode">[11:38:52]</span><span class="username">Andy:</span><span class="message">i got sidetracked. dbase 4/4 started. deploy done. qa env online in 10 mins</span></span>
            <span class="line"><span class="timecode">[11:47:34]</span><span class="message">qa env online. give a few mins for first page load</span></span>
            <span class="line"><span class="timecode">[12:54:25]</span><span class="username">Michael:</span><span class="message">nvm  caching</span></span>
            <span class="line"><span class="timecode">[12:31:04]</span><span class="username">Andy:</span><span class="message">kids,  I have to restart 03. I'm changing a configuration parameter</span></span>
            <span class="line"><span class="timecode">[12:33:24]</span><span class="username">Michael:</span><span class="message">Just got Lucci to make a bunch of corrections on the gateway page values in the cms</span></span>
            <span class="line"><span class="timecode">[12:34:06]</span><span class="message">updated gateway page mock is now uploaded to box</span></span>
            <span class="line"><span class="timecode">[12:34:43]</span><span class="username">Andy:</span><span class="message">ok, good work</span></span>
            <span class="line"><span class="timecode">[12:05:29]</span><span class="username">Michael:</span><span class="message">QA team meeting?</span></span>
            <span class="line"><span class="timecode">[12:05:58]</span><span class="username">Andy:</span><span class="message">no longer having qa team meetings until the new manager starts</span></span>
            <span class="line"><span class="timecode">[12:06:20]</span><span class="message">he'll pick them up in the format that will suit him</span></span>
            <span class="line"><span class="timecode">[12:06:42]</span><span class="username">Michael:</span><span class="message">k</span></span>
            <span class="line"><span class="timecode">[12:06:50]</span><span class="message">is he around today?</span></span>
            <span class="line"><span class="timecode">[12:06:56]</span><span class="message">1st day on the job</span></span>
            <span class="line"><span class="timecode">[12:06:59]</span><span class="username">Andy:</span><span class="message">i'm not in the office so i dont know</span></span>
            <span class="line"><span class="timecode">[12:07:02]</span><span class="username">Michael:</span><span class="message">ah ok</span></span>
            <span class="line"><span class="timecode">[12:07:31]</span><span class="message">"where the team"? "at home.  bunch of slackers  all 5 off site" :P</span></span>
            <span class="line"><span class="timecode">[12:08:13]</span><span class="message">how's the tummy Andy?</span></span>
            <span class="line"><span class="timecode">[12:08:18]</span><span class="username">Andy:</span><span class="message">much like the linux kernel dev team</span></span>
            <span class="line"><span class="timecode">[12:08:21]</span><span class="message">bad today</span></span>
            <span class="line"><span class="timecode">[12:08:25]</span><span class="username">Michael:</span><span class="message">don't get me started</span></span>
            <span class="line"><span class="timecode">[12:08:49]</span><span class="message">apparently there are some motherboards that are incompatible with ubuntu :(</span></span>
            <span class="line"><span class="timecode">[12:09:14]</span><span class="username">Andy:</span><span class="message">How did you find that out?</span></span>
            <span class="line"><span class="timecode">[12:09:44]</span><span class="username">Michael:</span><span class="message">a friend who is a Linux user (and not one of the less helpful ones) mentioned it</span></span>
            <span class="line"><span class="timecode">[12:10:07]</span><span class="message">next question is finding out what MotherBoard I have</span></span>
            <span class="line"><span class="timecode">[12:10:15]</span><span class="message">asus something</span></span>
            <span class="line"><span class="timecode">[12:10:23]</span><span class="username">Andy:</span><span class="message">crack the box open and get a torch</span></span>
            <span class="line"><span class="timecode">[12:10:34]</span><span class="username">Michael:</span><span class="message">A7N8X was the old one.  not sure the current version I have</span></span>
            <span class="line"><span class="timecode">[12:10:38]</span><span class="message">yeah</span></span>
            <span class="line"><span class="timecode">[12:10:52]</span><span class="message">torch it shall be</span></span>
            <span class="line"><span class="timecode">[12:11:05]</span><span class="message">but not now  the office is keeping it out of the line of sight</span></span>
            <span class="line"><span class="timecode">[12:11:26]</span><span class="message">otherwise it sits there glaring at me and reminding me of an oversized doorstop ;)</span></span>
            <span class="line"><span class="timecode">[12:12:18]</span><span class="username">Andy:</span><span class="message">honestly,  i'd just try another distro if i was you. </span></span>
            <span class="line"><span class="timecode">[12:14:18]</span><span class="username">Michael:</span><span class="message">kernel panic</span></span>

            <span class="line"><span class="system_message">&lt;&lt;&lt; bojan has left &gt;&gt;&gt;</span></span>

            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                there&nbsp;are&nbsp;probably&nbsp;other&nbsp;ways&nbsp;of&nbsp;saying&nbsp;it,&nbsp;but&nbsp;it's&nbsp;also&nbsp;fine&nbsp;to&nbsp;say&nbsp;that<br />
                i've&nbsp;been&nbsp;bored.&nbsp;&nbsp;i&nbsp;don't&nbsp;know&nbsp;why.&nbsp;there&nbsp;have&nbsp;been&nbsp;projects&nbsp;i'm&nbsp;not&nbsp;ashamed<br />
                of,&nbsp;but&nbsp;most&nbsp;of&nbsp;the&nbsp;time&nbsp;it&nbsp;hasn't&nbsp;been&nbsp;like&nbsp;that.&nbsp;i&nbsp;wish&nbsp;i&nbsp;could&nbsp;say&nbsp;i&nbsp;was<br />
                young&nbsp;i&nbsp;needed&nbsp;the&nbsp;money&nbsp;but&nbsp;i'm&nbsp;not&nbsp;even&nbsp;that&nbsp;young&nbsp;anymore.&nbsp;health&nbsp;insurance<br />
                and&nbsp;that&nbsp;type&nbsp;of&nbsp;stuff&nbsp;is&nbsp;a&nbsp;work&nbsp;of&nbsp;fiction.&nbsp;my&nbsp;life&nbsp;is&nbsp;only&nbsp;as&nbsp;long&nbsp;as&nbsp;my<br />
                computer's&nbsp;life.</span>
            </span>
            <span class="line"><span class="timecode">[12:30:18]</span><span class="username">Michael:</span><span class="message">Was it something I said? </span></span>
            <span class="line"><span class="timecode">[12:31:01]</span><span class="message">or didn't say</span></span>
            <span class="line"><span class="timecode">[12:31:04]</span><span class="username">Andy:</span><span class="message">heh :) bojan's a too-much-information-a-phobe</span></span>
            <span class="line"><span class="timecode">[12:31:09]</span><span class="username">Michael:</span><span class="message">he doesn't want soft skin</span></span>
            <span class="line"><span class="timecode">[12:31:12]</span><span class="message">being gritty and only on a need-to-know basis keeps him sharp</span></span>
            <span class="line"><span class="timecode">[12:31:30]</span><span class="message">has anyone noticed that he doesn't (always) use THE or A [articles] in sentences</span></span>
            <span class="line"><span class="timecode">[12:31:45]</span><span class="message">(it's common in Slavic langs to do that)</span></span>
            <span class="line"><span class="timecode">[12:31:53]</span><span class="message">I found it funny in my last co that our ex-Yugoslavs used to say "vee hev problem"</span></span>
            <span class="line"><span class="timecode">[12:32:19]</span><span class="username">Andy:</span><span class="message">russians especially</span></span>
        </p>
        <h4>the non working chat</h4>
        <p>
            <span class="line"><span class="username ivan">Ivan:</span><span class="message ivan">
                it's&nbsp;depressing&nbsp;to&nbsp;see&nbsp;that&nbsp;some&nbsp;cliches&nbsp;are&nbsp;true.&nbsp;the&nbsp;offices&nbsp;of&nbsp;lab&nbsp;rats<br />
                typing&nbsp;looking&nbsp;for&nbsp;the&nbsp;key&nbsp;of&nbsp;the&nbsp;cookie,&nbsp;waiting&nbsp;to&nbsp;be&nbsp;rewarded&nbsp;with&nbsp;a<br />
                cookie,&nbsp;and&nbsp;kept&nbsp;awake&nbsp;with&nbsp;coffee.&nbsp;i&nbsp;could&nbsp;have&nbsp;passed&nbsp;out&nbsp;in&nbsp;front&nbsp;of&nbsp;the<br />
                computer&nbsp;and&nbsp;no&nbsp;one&nbsp;would&nbsp;have&nbsp;noticed.&nbsp;the&nbsp;feeling&nbsp;that&nbsp;no&nbsp;one&nbsp;knows&nbsp;what<br />
                they're&nbsp;doing.&nbsp;the&nbsp;obscure&nbsp;files&nbsp;that&nbsp;you&nbsp;can&nbsp;find&nbsp;inside&nbsp;of&nbsp;some&nbsp;computers.<br />
                what&nbsp;i&nbsp;would&nbsp;do&nbsp;is&nbsp;open&nbsp;them&nbsp;for&nbsp;as&nbsp;long&nbsp;as&nbsp;i'd&nbsp;stand&nbsp;it,&nbsp;close&nbsp;my&nbsp;eyes,&nbsp;press<br />
                some&nbsp;random&nbsp;keys,&nbsp;close&nbsp;them&nbsp;and&nbsp;try&nbsp;to&nbsp;forget&nbsp;about&nbsp;it.&nbsp;there's&nbsp;determinacy<br />
                in&nbsp;software&nbsp;insofar&nbsp;as&nbsp;you&nbsp;can&nbsp;work&nbsp;like&nbsp;this&nbsp;and&nbsp;nothing&nbsp;breaks.</span>
            </span>
            <span class="line"><span class="timecode">[13:03:36]</span><span class="username">Andy:</span><span class="message">too much non work chat in the work chats tends to piss a few ppl off, so we made this chat for jibberish banter</span></span>
            <span class="line"><span class="timecode">[13:03:52]</span><span class="username">Daniel:</span><span class="message">oh, ok - have i spoke too much?</span></span>
            <span class="line"><span class="timecode">[13:03:57]</span><span class="username">Andy:</span><span class="message">nah :)</span></span>
            <span class="line"><span class="timecode">[13:04:06]</span><span class="message">but bojan is pulling faces</span></span>
            <span class="line"><span class="timecode">[13:04:26]</span><span class="message">meaning his threshold for jibberish has been reached and any more he'll start to flip out</span></span>
            <span class="line"><span class="timecode">[13:05:00]</span><span class="username">Daniel:</span><span class="message">kk - haha ive only chipped in a couple of replies :(</span></span>
            <span class="line"><span class="timecode">[13:05:17]</span><span class="username">Andy:</span><span class="message">dont worry about it :)</span></span>
            <span class="line"><span class="timecode">[13:05:25]</span><span class="username">Michael:</span><span class="message">I think it's coz Bojan's pc is giving him stick so he might have a sense of humur failure</span></span>
            <span class="line"><span class="timecode">[13:05:48]</span><span class="username">Andy:</span><span class="message">interesting theory. i let you raise that with him to see if thats the case :)</span></span>
            <span class="line"><span class="timecode">[13:06:17]</span><span class="message">while i'm at it... i'll add sandy</span></span>
            <span class="line"><span class="timecode">[13:06:28]</span><span class="system_message">*** Andy added Sandy  ***</span></span>
            <span class="line"><span class="timecode">[13:06:31]</span><span class="message">hi sandy</span></span>
            <span class="line"><span class="timecode">[13:06:39]</span><span class="message">this is the new non work chat chat</span></span>
            <span class="line"><span class="timecode">[13:06:39]</span><span class="username">Michael:</span><span class="message">welcome sandy</span></span>
            <span class="line"><span class="timecode">[13:06:51]</span><span class="username">Andy:</span><span class="message">feel free to rabbit on as much as you want here</span></span>
            <span class="line"><span class="timecode">[13:06:52]</span><span class="username">Michael:</span><span class="message">sandy's full of beans and appreciates obscurity</span></span>
            <span class="line"><span class="timecode">[13:07:15]</span><span class="username">Sandy:</span><span class="message">full of beans?</span></span>
            <span class="line"><span class="timecode">[13:07:21]</span><span class="username">Michael:</span><span class="message">energy</span></span>
            <span class="line"><span class="timecode">[13:07:25]</span><span class="username">Andy:</span><span class="message">also feel free to add anyone you think would like to be in the non work chat</span></span>
            <span class="line"><span class="timecode">[13:07:41]</span><span class="username">Michael:</span><span class="message">don't you mean all except Bojan?</span></span>
            <span class="line"><span class="timecode">[13:08:05]</span><span class="username">Andy:</span><span class="message">well half the team come to mind as non members</span></span>
            <span class="line"><span class="timecode">[13:12:22]</span><span class="username">Martin:</span><span class="message">brains...</span></span>
            <span class="line"><span class="timecode">[13:12:26]</span><span class="username">Sandy:</span><span class="message">did we get told off for chitchatting?</span></span>
            <span class="line"><span class="timecode">[13:12:53]</span><span class="username">Martin:</span><span class="message">soory. think i had a zombie flashback for a moment there</span></span>
            <span class="line"><span class="timecode">[13:13:46]</span><span class="username">Michael:</span><span class="message">vegetarian zombies eat g r a i n s</span></span>
            <span class="line"><span class="timecode">[13:13:51]</span><span class="username">Mark:</span><span class="message">Welcome Sandy!</span></span>
            <span class="line"><span class="timecode">[13:13:58]</span><span class="username">Martin:</span><span class="message">re: CAKE at 4pm. // can someone email me a slice? ta!</span></span>
            <span class="line"><span class="timecode">[13:14:34]</span><span class="username">Sandy:</span><span class="message">is this chat the quarantine?</span></span>
            <span class="line"><span class="timecode">[13:14:46]</span><span class="message">aka, shut up in the other chats, Sandy?</span></span>
            <span class="line"><span class="timecode">[13:14:54]</span><span class="username">Daniel:</span><span class="message">:D</span></span>
            <span class="line"><span class="timecode">[13:15:19]</span><span class="username">Sandy:</span><span class="message">we should change the name to The Peanut Gallery</span></span>
            <span class="line"><span class="timecode">[13:17:56]</span><span class="username">Andy:</span><span class="message">@ sandy - not told off, but i've had talks with unnamed ppl about keeping non work chatter to a minimum (or totally off) work chats because it interferes with ppls ability to make skype useful</span></span>
            <span class="line"><span class="timecode">[13:18:08]</span><span class="username">Andy:</span><span class="message">alan isn't back yet is he?</span></span>
            <span class="line"><span class="timecode">[13:18:20]</span><span class="username">Michael:</span><span class="message">no names mentioned, eh andy?</span></span>
            <span class="line"><span class="timecode">[13:18:21]</span><span class="username">Sandy:</span><span class="message">noted</span></span>
            <span class="line"><span class="timecode">[13:18:25]</span><span class="message">no</span></span><span class="line"><span class="timecode">[13:18:35]</span><span class="username">Andy:</span><span class="message">i'll add him when he is cause he's a jibber jabberer</span></span>
            <span class="line"><span class="timecode">[13:18:36]</span><span class="username">Michael:</span><span class="message">"random fact guy"</span></span>
            <span class="line"><span class="timecode">[13:18:56]</span><span class="message">he'd be great in a pub quiz</span></span>
            <span class="line"><span class="timecode">[13:19:11]</span><span class="username">Sandy:</span><span class="message">non work chatter keeps my brain active</span></span>
            <span class="line"><span class="timecode">[13:19:13]</span><span class="message">i object</span></span>
            <span class="line"><span class="timecode">[13:19:23]</span><span class="username">Andy:</span><span class="message">noted</span></span>
            <span class="line"><span class="timecode">[13:19:41]</span><span class="username">Michael:</span><span class="message">you object to what?</span></span>
            <span class="line"><span class="timecode">[13:19:50]</span><span class="username">Sandy:</span><span class="message">to keeping work chatter to a minimum</span></span>
            <span class="line"><span class="timecode">[13:20:05]</span><span class="username">Andy:</span><span class="message">heh... you're giving that cat a workout today</span></span>
            <span class="line"><span class="timecode">[13:20:17]</span><span class="username">Sandy:</span><span class="message">discussing whether to spread cheeze whiz left to right as opposed to right to left helps my creative problemsolving skills</span></span>
            <span class="line"><span class="timecode">[13:20:25]</span><span class="username">Michael:</span><span class="message">I still haven't worked out the cat thing. I am doign a Steve Jobs (I must be doing it wrong)</span></span>
            <span class="line"><span class="timecode">[13:20:43]</span><span class="username">Sandy:</span><span class="message">i'm grumbling</span></span>
            <span class="line"><span class="timecode">[13:20:49]</span><span class="username">Andy:</span><span class="message">you need to have it in your icon list</span></span>
            <span class="line"><span class="timecode">[13:20:59]</span><span class="username">Sandy:</span><span class="message">wrong</span></span>
            <span class="line"><span class="timecode">[13:21:07]</span><span class="username">Andy:</span><span class="message">i'm never wrong</span></span>
            <span class="line"><span class="timecode">[13:21:11]</span><span class="message">that's why i'm in qa</span></span>
            <span class="line"><span class="timecode">[13:28:59]</span><span class="message">mrbreaker76: never wrong?</span></span>
            <span class="line"><span class="timecode">[13:29:22]</span><span class="message">note to all - do not follow andy around when he thinks he knows where he is going</span></span>
            <span class="line"><span class="timecode">[13:32:24]</span><span class="username">Sandy:</span><span class="message">this feels like detention</span></span>
            <span class="line"><span class="timecode">[13:41:43]</span><span class="username">Claudia:</span><span class="message">hey Mike, on my turn, I haven't figured out the Steve Jobs thing</span></span>
            <span class="line"><span class="timecode">[13:42:46]</span><span class="username">Sandy:</span><span class="message">neither has Mike</span></span>
            <span class="line"><span class="timecode">[13:42:48]</span><span class="message">HAHAHAHAHAHAHHAA</span></span>
            <span class="line"><span class="timecode">[13:43:05]</span><span class="username">Andy:</span><span class="message">@ rak - i got us there in the end</span></span>
            <span class="line"><span class="timecode">[13:43:23]</span><span class="message">i took you the scenic route</span></span>
            <span class="line"><span class="timecode">[13:44:43]</span><span class="username">Claudia:</span><span class="message">tours are always a plus</span></span>
            <span class="line"><span class="timecode">[13:54:42]</span><span class="system_message">*** mrbeeansr76 has left ***</span></span>
            <span class="line"><span class="timecode">[13:56:58]</span><span class="username">Andy:</span><span class="message">haha :)</span></span>
            <span class="line"><span class="timecode">[13:57:18]</span><span class="message">i guess he didnt like the non work chat</span></span>
            <span class="line"><span class="timecode">[13:57:26]</span><span class="message">very serious guy that raj</span></span>
            <span class="line"><span class="timecode">[14:12:08]</span><span class="username">Mark:</span><span class="message">Mark has left</span></span>
            <span class="line"><span class="timecode">[14:12:14]</span><span class="username">Mark:</span><span class="message">((bandit))</span></span>
            <span class="line"><span class="timecode">[14:13:41]</span><span class="username">Andy:</span><span class="message">Andy has existentially left his body but remains in this chat</span></span>
            <span class="line"><span class="timecode">[14:20:54]</span><span class="username">Daniel:</span><span class="message">i dont want to get told off so im just observing :)</span></span>
            <span class="line"><span class="timecode">[14:20:55]</span><span class="username">Claudia:</span><span class="message">hey martin ! you are missing cakes while in england!</span></span>
            <span class="line"><span class="timecode">[14:21:19]</span><span class="username">Sandy:</span><span class="message">mmmmm.... raspberry brownies....</span></span>
            <span class="line"><span class="timecode">[14:24:03]</span><span class="username">Andy:</span><span class="message">jabber away in this chat, dan. you get prizes at the end of the day if you can keep posting here non stop</span></span>
            <span class="line"><span class="timecode">[14:24:22]</span><span class="username">Sandy:</span><span class="message">Andy will give you the 5 cents he got for listening to Adele</span></span>
            <span class="line"><span class="timecode">[14:24:32]</span><span class="username">Andy:</span><span class="message">NOT!</span></span>
            <span class="line"><span class="timecode">[14:24:33]</span><span class="username">Daniel:</span><span class="message">:)</span></span>
            <span class="line"><span class="timecode">[14:25:00]</span><span class="username">Martin:</span><span class="message">raspberry brownies? what colour is a raspberry brownie?</span></span>
            <span class="line"><span class="timecode">[14:25:08]</span><span class="username">Daniel:</span><span class="message">maroon</span></span>
            <span class="line"><span class="timecode">[14:25:41]</span><span class="username">Sandy:</span><span class="message">it's not quite as red as a Red Velvet cupcake</span></span>
            <span class="line"><span class="timecode">[14:26:11]</span><span class="username">Martin:</span><span class="message">I've asked you not to call me that in public</span></span>
            <span class="line"><span class="timecode">[14:26:31]</span><span class="username">Sandy:</span><span class="message">awww</span></span>
            <span class="line"><span class="timecode">[14:27:52]</span><span class="username">Claudia:</span><span class="message">what is it from?</span></span>
            <span class="line"><span class="timecode">[14:28:06]</span><span class="username">Martin:</span><span class="message">kittens</span></span>
            <span class="line"><span class="timecode">[14:28:11]</span><span class="username">Daniel:</span><span class="message">:O</span></span>
            <span class="line"><span class="timecode">[14:28:54]</span><span class="username">Sandy:</span><span class="message">ew</span></span>
            <span class="line"><span class="timecode">[14:35:21]</span><span class="username">Michael:</span><span class="message">sfw = ?</span></span>
            <span class="line"><span class="timecode">[14:35:29]</span><span class="message">yoda's description of single white female</span></span><span class="line"><span class="timecode">[14:36:18]</span><span class="username">Andy:</span><span class="message">ohhhh mike...</span></span>
            <span class="line"><span class="timecode">[14:36:41]</span><span class="username">Sandy:</span><span class="message">tfw</span></span>
            <span class="line"><span class="timecode">[14:36:46]</span><span class="username">Andy:</span><span class="message">we need to get you to a beginners web geek course</span></span>
            <span class="line"><span class="timecode">[14:36:50]</span><span class="username">Sandy:</span><span class="message">yoda's version for i don't understand</span></span>
            <span class="line"><span class="timecode">[14:37:15]</span><span class="username">Andy:</span><span class="message">NSFW is important to know</span></span>
            <span class="line"><span class="timecode">[14:37:38]</span><span class="username">Sandy:</span><span class="message">A pissed off person's compass?</span></span>
            <span class="line"><span class="timecode">[14:40:41]</span><span class="username">Andy:</span><span class="message">heh... no, but very inventive of you</span></span>
            <span class="line"><span class="timecode">[15:00:04]</span><span class="username">Michael:</span><span class="message"><a href="http://news.bbc.co.uk/1/hi/8248056.stm">http://news.bbc.co.uk/1/hi/8248056.stm</a></span></span>
            <span class="line"><span class="timecode">[15:00:12]</span><span class="message">an old one but still a good one</span></span>
            <span class="line"><span class="timecode">[15:00:35]</span><span class="message">(same issue here because it's ADSL not SDSL but hey, we like a good yarn)</span></span>
            <span class="line"><span class="timecode">[15:01:45]</span><span class="username">Martin:</span><span class="message">ha! 'Telkom said it was not responsible for the firm's slow internet speeds.'</span></span>
            <span class="line"><span class="timecode">[15:01:56]</span><span class="message">that's what i like. flat denial</span></span><span class="line"><span class="timecode">[15:02:06]</span><span class="username">Andy:</span><span class="message">that's hilarious</span></span>
            <span class="line"><span class="timecode">[15:02:30]</span><span class="username">Martin:</span><span class="message">works for me. did u check this? no.</span></span>
            <span class="line"><span class="timecode">[15:03:03]</span><span class="username">Andy:</span><span class="message">They included "no cats allowed" and "birdseed must not have any performance- enhancing seeds within".</span></span>
            <span class="line"><span class="timecode">[15:03:44]</span><span class="username">Claudia:</span><span class="message">Claudia will use the expression 'flat denial'  more often. Love it!</span></span>
            <span class="line"><span class="timecode">[15:05:03]</span><span class="username">Andy:</span><span class="message">this is a tactic i have used to great effect in my working career. In the face of overwhelming evidence, flat deny  everything, and make loud counter accusations at being framed.</span></span>
            <span class="line"><span class="timecode">[15:05:22]</span><span class="username">Martin:</span><span class="message">goes well with a dead eye stare, i find. And a slightly curlled lip.... can u tell i have teenagers at home?</span></span>
            <span class="line"><span class="timecode">[15:05:46]</span><span class="username">Andy:</span><span class="message">heh :) i would have said experience managing qa groups</span></span>
            <span class="line"><span class="timecode">[15:08:07]</span><span class="message">goddamn right i am!</span></span>
            <span class="line">
                <span class="username ivan">Ivan:</span>
                <span class="message ivan">
                    i&nbsp;wish&nbsp;i&nbsp;could&nbsp;live&nbsp;in&nbsp;a&nbsp;mountain&nbsp;and&nbsp;contemplate&nbsp;my&nbsp;mark-up.&nbsp;&nbsp;i&nbsp;wish&nbsp;it&nbsp;was,<br />
                    but&nbsp;it&nbsp;can't&nbsp;be&nbsp;and&nbsp;it&nbsp;isn't&nbsp;only&nbsp;about&nbsp;the&nbsp;code.&nbsp;if&nbsp;it&nbsp;was&nbsp;only&nbsp;about&nbsp;the<br />
                    code,&nbsp;i&nbsp;wouldn't&nbsp;need&nbsp;to&nbsp;go&nbsp;out&nbsp;of&nbsp;my&nbsp;room.&nbsp;i&nbsp;don't&nbsp;know&nbsp;what&nbsp;it's&nbsp;about,&nbsp;and&nbsp;i<br />
                    don't&nbsp;know&nbsp;what&nbsp;i'm&nbsp;talking&nbsp;about.&nbsp;this&nbsp;is&nbsp;the&nbsp;point&nbsp;where&nbsp;i&nbsp;start&nbsp;to&nbsp;have<br />
                    problems&nbsp;finishing&nbsp;my&nbsp;sentences.&nbsp;likewise,&nbsp;this&nbsp;type&nbsp;of&nbsp;media&nbsp;work&nbsp;is&nbsp;complete<br />
                    nonsense.&nbsp;it's&nbsp;absurd&nbsp;that&nbsp;i&nbsp;can't&nbsp;find&nbsp;a&nbsp;job,&nbsp;and&nbsp;that&nbsp;i&nbsp;can't&nbsp;hold&nbsp;on&nbsp;to&nbsp;the<br />
                    jobs&nbsp;that&nbsp;i&nbsp;hate.<br />
                    <br />
                    after&nbsp;one&nbsp;year&nbsp;of&nbsp;writing&nbsp;software,&nbsp;it's&nbsp;good&nbsp;to&nbsp;go&nbsp;back&nbsp;to&nbsp;the&nbsp;first&nbsp;things&nbsp;i<br />
                    wrote.&nbsp;maybe&nbsp;there&nbsp;is&nbsp;something&nbsp;of&nbsp;crawling&nbsp;into&nbsp;my&nbsp;bed&nbsp;and&nbsp;pulling&nbsp;up&nbsp;the<br />
                    covers&nbsp;about&nbsp;it.&nbsp;probably&nbsp;not.&nbsp;i'm&nbsp;just&nbsp;happy.&nbsp;it&nbsp;was&nbsp;great&nbsp;to&nbsp;have&nbsp;imagined<br />
                    an&nbsp;introductory&nbsp;perl&nbsp;manual&nbsp;where&nbsp;the&nbsp;examples&nbsp;and&nbsp;exercises&nbsp;deal&nbsp;with<br />
                    generative&nbsp;groff&nbsp;mark-up.
                </span>
            </span>
        </p>
</div>
