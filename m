Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 2/5] remoteproc: Check for NULL firmwares in sysfs
 interface
References: <20180915003725.17549-1-s-anna@ti.com>
 <20180915003725.17549-3-s-anna@ti.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <a74114d9-e4d6-3f13-add8-2025d0d320f8@st.com>
Date: Tue, 2 Oct 2018 11:43:30 +0200
MIME-Version: 1.0
In-Reply-To: <20180915003725.17549-3-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Suman,

On 09/15/2018 02:37 AM, Suman Anna wrote:
> The remoteproc framework provides a sysfs file 'firmware'
> for modifying the firmware image name from userspace. Add
> an additional check to ensure NULL firmwares are errored
> out right away, rather than getting a delayed error while
> requesting a firmware during the start of a remoteproc
> later on.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
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
This patch fixes only the case of a null name but not a bad name. So I'm
not one hundred percent sure that it is relevant, as it treats only a
part of the problem. But it's fine with me if it is accepted.

Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Regards
Arnaud

>  
>  	p = kstrndup(buf, len, GFP_KERNEL);
>  	if (!p) {
> 
