Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] rpmsg: rpmsg_core: fix null-ptr dereference for devices
 without ops
References: <1496403321-32234-1-git-send-email-henri.roosen@ginzinger.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <46048bd4-482d-37e8-9701-71754f72ffc2@ti.com>
Date: Fri, 2 Jun 2017 16:47:51 -0500
MIME-Version: 1.0
In-Reply-To: <1496403321-32234-1-git-send-email-henri.roosen@ginzinger.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Henri Roosen <henri.roosen@ginzinger.com>, linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Henri,

On 06/02/2017 06:35 AM, Henri Roosen wrote:
> A device might not have an ops structure registered. This

The rpmsg devices are registered from the respective backends, which are
supposed to plug in their ops. What is the scenario where you think
these ops might not be populated? We ought to check for NULL ops in
rpmsg_register_device in fact to make sure an ops pointer is supplied.

regards
Suman

> patch fixes a null-prt dereference by checking ops before dereferencing
> it.
> 
> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
> ---
>  drivers/rpmsg/rpmsg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 600f5f9..0c48452 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -429,7 +429,7 @@ static int rpmsg_dev_probe(struct device *dev)
>  		goto out;
>  	}
>  
> -	if (rpdev->ops->announce_create)
> +	if (rpdev->ops && rpdev->ops->announce_create)
>  		err = rpdev->ops->announce_create(rpdev);
>  out:
>  	return err;
> 
