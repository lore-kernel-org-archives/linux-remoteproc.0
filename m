Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 26 May 2017 18:12:08 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/2] remoteproc: Introduce rproc_{start,stop}()
 functions
Message-ID: <20170527011208.GA1730@builder>
References: <1495842661-8926-1-git-send-email-spjoshi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495842661-8926-1-git-send-email-spjoshi@codeaurora.org>
To: Sarangdhar Joshi <spjoshi@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 26 May 16:51 PDT 2017, Sarangdhar Joshi wrote:

> In the context of recovering from crash, rproc_trigger_recovery() does
> rproc_shutdown() followed by rproc_boot(). The remoteproc resources are
> cleaned up in rproc_shutdown() and immediately reallocated in
> rproc_boot() which is an unnecessary overhead. Furthermore, we want the
> memory regions to be accessible after stopping the remote processor, to
> be able to extract the memory content for a coredump.
> 
> This patch factors out the code in rproc_boot() and rproc_shutdown()
> path and introduces rproc_{start,stop}() in order to avoid resource
> allocation overhead.
> 
> Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>

Both patches applied.

Thanks,
Bjorn
