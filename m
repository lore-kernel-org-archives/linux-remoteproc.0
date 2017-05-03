Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 2 May 2017 17:02:05 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] remoteproc: Introduce rproc_{start,stop}() functions
Message-ID: <20170503000205.GZ15143@minitux>
References: <1493758742-26148-1-git-send-email-spjoshi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493758742-26148-1-git-send-email-spjoshi@codeaurora.org>
To: Sarangdhar Joshi <spjoshi@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 02 May 13:59 PDT 2017, Sarangdhar Joshi wrote:

> In the context of recovering from crash,
> rproc_trigger_recovery() does rproc_shutdown() followed
> by rproc_boot(). The remoteproc resources are cleaned up
> in rproc_shutdown() and immediately reallocated in
> rproc_boot() which is an unnecessary overhead.
> 
> Furthermore, we want the memory regions to be accessible
> after stopping the remote processor, to be able to extract
> the memory content for a coredump.
> 
> The current patch factors out the code in rproc_boot() and

"This patch factors..."

> rproc_shutdown() path and introduces rproc_{start,stop}()
> in order to avoid resource allocation overhead.
> 

I think the result of the two patches looks good.

But I would prefer if you splice them differently. If I read the patches
correctly you should be able to introduce rproc_start()/stop() and move
rproc_boot()/shutdown() over to use these in one patch and then in a
second patch modify the behavior of the recovery.

That way if one bisects any issues to either one we know if it was the
refactoring or the modification of the recovery behavior.

Regards,
Bjorn
