Date: Fri, 5 Oct 2018 23:22:31 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] samples/rpmsg: Introduce a module parameter for message
 count
Message-ID: <20181006062231.GF12063@builder>
References: <20180911174643.26199-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180911174643.26199-1-s-anna@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 11 Sep 10:46 PDT 2018, Suman Anna wrote:

> The current rpmsg_client_sample uses a fixed number of messages to
> be sent to each instance. This is currently set at 100. Introduce
> an optional module parameter 'count' so that the number of messages
> to be exchanged can be made flexible.
> 

Rather than sending N messages as fast as possible to any sample channel
that comes up, how about making the sample create a debugfs entry that
we can write messages to from user space?

That would make it possible to improve the handling of multiple
remoteprocs and would allow for a variation in message lengths etc.

Regards,
Bjorn

> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  samples/rpmsg/rpmsg_client_sample.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
> index f161dfd3e70a..9b6b27ea504f 100644
> --- a/samples/rpmsg/rpmsg_client_sample.c
> +++ b/samples/rpmsg/rpmsg_client_sample.c
> @@ -22,7 +22,9 @@
>  #include <linux/rpmsg.h>
>  
>  #define MSG		"hello world!"
> -#define MSG_LIMIT	100
> +
> +static int count = 100;
> +module_param(count, int, 0644);
>  
>  struct instance_data {
>  	int rx_count;
> @@ -41,7 +43,7 @@ static int rpmsg_sample_cb(struct rpmsg_device *rpdev, void *data, int len,
>  		       data, len,  true);
>  
>  	/* samples should not live forever */
> -	if (idata->rx_count >= MSG_LIMIT) {
> +	if (idata->rx_count >= count) {
>  		dev_info(&rpdev->dev, "goodbye!\n");
>  		return 0;
>  	}
> -- 
> 2.18.0
> 
