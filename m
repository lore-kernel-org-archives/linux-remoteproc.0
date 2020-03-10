Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v4 1/4] remoteproc: Traverse rproc_list under RCU read
 lock
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
 <20200310063817.3344712-2-bjorn.andersson@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <87a14705-186d-01a4-e8a5-1844dab4ea14@st.com>
Date: Tue, 10 Mar 2020 14:41:00 +0100
MIME-Version: 1.0
In-Reply-To: <20200310063817.3344712-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,


On 3/10/20 7:38 AM, Bjorn Andersson wrote:
> In order to be able to traverse the mostly read-only rproc_list without
> locking during panic migrate traversal to be done under rcu_read_lock().
> 
> Mutual exclusion for modifications of the list continues to be handled
> by the rproc_list_mutex and a synchronization point is added before
> releasing objects that are popped from the list.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Change v3:
> - New patch
> 
>  drivers/remoteproc/remoteproc_core.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..f0a77c30c6b1 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1854,8 +1854,8 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  	if (!np)
>  		return NULL;
>  
> -	mutex_lock(&rproc_list_mutex);
> -	list_for_each_entry(r, &rproc_list, node) {
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(r, &rproc_list, node) {
>  		if (r->dev.parent && r->dev.parent->of_node == np) {
>  			/* prevent underlying implementation from being removed */
>  			if (!try_module_get(r->dev.parent->driver->owner)) {
> @@ -1868,7 +1868,7 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  			break;
>  		}
>  	}
> -	mutex_unlock(&rproc_list_mutex);
> +	rcu_read_unlock();
>  
>  	of_node_put(np);
>  
> @@ -1925,7 +1925,7 @@ int rproc_add(struct rproc *rproc)
>  
>  	/* expose to rproc_get_by_phandle users */
>  	mutex_lock(&rproc_list_mutex);
> -	list_add(&rproc->node, &rproc_list);
> +	list_add_rcu(&rproc->node, &rproc_list);
>  	mutex_unlock(&rproc_list_mutex);
>  
>  	return 0;
> @@ -2140,9 +2140,12 @@ int rproc_del(struct rproc *rproc)
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
>  	mutex_lock(&rproc_list_mutex);
> -	list_del(&rproc->node);
> +	list_del_rcu(&rproc->node);
>  	mutex_unlock(&rproc_list_mutex);
i'm not familiar with rcu but as rproc_panic_handler can be called in interrupt context, 
does mutex should be replaced by a spinlock?

Regards,
Arnaud
>  
> +	/* Ensure that no readers of rproc_list are still active */
> +	synchronize_rcu();
> +
>  	device_del(&rproc->dev);
>  
>  	return 0;
> 
