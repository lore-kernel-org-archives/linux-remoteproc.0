Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 18 Oct 2016 15:19:54 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/3] remoteproc: Fix module autoload for qcom platform
 drivers
Message-ID: <20161018221954.GD19384@tuxbot>
References: <1476825861-7880-1-git-send-email-javier@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476825861-7880-1-git-send-email-javier@osg.samsung.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 18 Oct 14:24 PDT 2016, Javier Martinez Canillas wrote:

> Hello,
> 
> I noticed that module autoload won't be working in some of the qcom
> remoteproc drivers. This patch series contains the fixes for these.
> 

Thanks for spotting this, applied all three patches.

Regards,
Bjorn

> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (3):
>   remoteproc: qcom: q6v5_pil: Fix module autoload
>   remoteproc: qcom: wcnss: Fix module autoload
>   remoteproc: qcom: wcnss_iris: Fix module autoload
> 
>  drivers/remoteproc/qcom_q6v5_pil.c   | 1 +
>  drivers/remoteproc/qcom_wcnss.c      | 1 +
>  drivers/remoteproc/qcom_wcnss_iris.c | 1 +
>  3 files changed, 3 insertions(+)
> 
> -- 
> 2.7.4
> 
