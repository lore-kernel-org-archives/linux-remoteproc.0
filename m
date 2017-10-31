Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 30 Oct 2017 21:21:57 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/2] remoteproc: increase debug capabilities
Message-ID: <20171031042157.GB12511@builder>
References: <1509108082-22201-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509108082-22201-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 27 Oct 05:41 PDT 2017, Loic Pallardy wrote:

> This series increases remoteproc debug capabilities by adding:
> - associated resource table dump feature
> - registered carveouts list dump feature
> 

This looks very reasonable, can you please fix the problem reported by
0-day?

Regards,
Bjorn

> Loic Pallardy (2):
>   remoteproc: debug: add resource table dump feature
>   remoteproc: debug: add carveouts list dump feature
> 
>  drivers/remoteproc/remoteproc_debugfs.c | 130 ++++++++++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 
> -- 
> 1.9.1
> 
