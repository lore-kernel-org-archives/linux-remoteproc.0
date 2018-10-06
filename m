Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 5 Oct 2018 23:14:03 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/5] remoteproc: Check for NULL firmwares in sysfs
 interface
Message-ID: <20181006061403.GD12063@builder>
References: <20180915003725.17549-1-s-anna@ti.com>
 <20180915003725.17549-3-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180915003725.17549-3-s-anna@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 14 Sep 17:37 PDT 2018, Suman Anna wrote:

> The remoteproc framework provides a sysfs file 'firmware'
> for modifying the firmware image name from userspace. Add
> an additional check to ensure NULL firmwares are errored
> out right away, rather than getting a delayed error while
> requesting a firmware during the start of a remoteproc
> later on.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>

Applied.

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 2142b3ea726e..ce93f4d710f3 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -49,6 +49,11 @@ static ssize_t firmware_store(struct device *dev,
>  	}
>  
>  	len = strcspn(buf, "\n");
> +	if (!len) {
> +		dev_err(dev, "can't provide a NULL firmware\n");
> +		err = -EINVAL;
> +		goto out;
> +	}
>  
>  	p = kstrndup(buf, len, GFP_KERNEL);
>  	if (!p) {
> -- 
> 2.18.0
> 
