Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2] hwspinlock: ignore disabled device
References: <1552064026-11415-1-git-send-email-fabien.dessenne@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <b9059d73-9849-7105-6080-5d3d994335f3@ti.com>
Date: Fri, 31 May 2019 09:02:23 -0500
MIME-Version: 1.0
In-Reply-To: <1552064026-11415-1-git-send-email-fabien.dessenne@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Fabien Dessenne <fabien.dessenne@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 3/8/19 10:53 AM, Fabien Dessenne wrote:
> Do not wait for hwspinlock device registration if it is not available
> for use.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Acked-by: Suman Anna <s-anna@ti.com>

> ---
> V2: use 'goto out' instead of 'return'
> 
>  drivers/hwspinlock/hwspinlock_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
> index 2bad40d..d806307 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -333,6 +333,11 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
>  	if (ret)
>  		return ret;
>  
> +	if (!of_device_is_available(args.np)) {
> +		ret = -ENOENT;
> +		goto out;
> +	}
> +
>  	/* Find the hwspinlock device: we need its base_id */
>  	ret = -EPROBE_DEFER;
>  	rcu_read_lock();
> 
