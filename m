Date: Sun, 25 Jun 2017 14:51:48 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: rpmsg_core: fix null-ptr dereference for devices
 without ops
Message-ID: <20170625215148.GJ26155@builder>
References: <1496403321-32234-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496403321-32234-1-git-send-email-henri.roosen@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 02 Jun 04:35 PDT 2017, Henri Roosen wrote:

> A device might not have an ops structure registered. This
> patch fixes a null-prt dereference by checking ops before dereferencing
> it.
> 

In what scenario do you end up with a rpdev without ops defined?

You need at least create_ept defined in your ops to be able to do any
form of communication. So it would probably make more sense to add a
sanity check in rpmsg_register_device(), but perhaps I'm missing
something.


(If this is not true there are a bunch of other places where this needs
to be checked as well)

Regards,
Bjorn

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
> -- 
> 2.1.4
> 
