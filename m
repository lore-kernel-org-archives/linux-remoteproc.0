Date: Thu, 29 Aug 2019 12:09:57 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: glink: Use struct_size() helper
Message-ID: <20190829190955.GP6167@minitux>
References: <20190829181721.GA22554@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829181721.GA22554@embeddedor>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 29 Aug 11:17 PDT 2019, Gustavo A. R. Silva wrote:

> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct {
> 	...
> 	struct intent_pair intents[];
> } __packed * msg;
> 
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes.
> 
> So, replace the following form:
> 
> sizeof(*msg) + sizeof(struct intent_pair) * count
> 
> with:
> 
> struct_size(msg, intents, count)
> 
> This code was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thanks!

> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index f46c787733e8..621f1afd4d6b 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -892,7 +892,7 @@ static void qcom_glink_handle_intent(struct qcom_glink *glink,
>  		struct intent_pair intents[];
>  	} __packed * msg;
>  
> -	const size_t msglen = sizeof(*msg) + sizeof(struct intent_pair) * count;
> +	const size_t msglen = struct_size(msg, intents, count);
>  	int ret;
>  	int i;
>  	unsigned long flags;
> -- 
> 2.23.0
> 
