Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 6 Nov 2017 22:03:31 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 0/2] remoteproc: increase debug capabilities
Message-ID: <20171107060331.GA22677@builder>
References: <1509988196-24377-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509988196-24377-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 06 Nov 09:09 PST 2017, Loic Pallardy wrote:

> This series increases remoteproc debug capabilities by adding:
> - associated resource table dump feature
> - registered carveouts list dump feature
> 

Looks good, patches applied to rproc-next

Regards,
Bjorn

> ---
> Changes from V1:
> - Fix 0-DAY reported issues on open functions prototype
> - Rebase on Linux 4.14-rc8
> 
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
