Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 6 May 2016 11:44:06 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/5] remoteproc: core: Task sync during rproc_fw_boot()
Message-ID: <20160506184406.GD1256@tuxbot>
References: <1462454983-13168-1-git-send-email-lee.jones@linaro.org>
 <1462454983-13168-2-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462454983-13168-2-git-send-email-lee.jones@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com, ohad@wizery.com, linux-remoteproc@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 05 May 06:29 PDT 2016, Lee Jones wrote:

> By default, rproc_fw_boot() needs to wait for rproc to be configured,
> but a race may occur when using rpmsg/virtio.  In this case, it can
> be called locally in a safe manor.
> 
> This patch represents two usecases:
> 
>  - External call (via exported rproc_boot()), which waits
>  - Internal call can use 'nowait' version of rproc_boot()
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Looks good

Applied to rproc-next.

Regards,
Bjorn
