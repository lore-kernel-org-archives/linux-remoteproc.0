Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B42BC433E7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 08:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1DA52224E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 08:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="tg8t9Yyx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729246AbgJOIrc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Oct 2020 04:47:32 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52386 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726329AbgJOIrb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Oct 2020 04:47:31 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09F8l00w024738;
        Thu, 15 Oct 2020 10:47:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=qaKQ7vm55F6QJ99/turaG/tzg6NejvmTZRik8jUDc0M=;
 b=tg8t9YyxgRdN/itBIJpkH8MChWuzYm2LfV5gOL3bAVJaIt/Vnin7DclGOh0PQPU4/c6W
 er02BQEHj4ZPVWn23mujlLaBmPvkONhloyKr1B1o/J+GHhm3i5gCXUoi2YEL9qOnhOEm
 4ySC/0nYYp+3ckP6PCGZzuRFgbGhjILIZ1sNtQko2U47N0QRtjpVgkr9pvGCfyLB+hzY
 rY2WBOI3a5M3fLHWGIqS16VFMRFOp0Y3CyosCOWt5x5iV+nMVKV/rYj8QVKCnDvIHSNa
 VdlOr+r0i/6r/Nxrg2Qpbj2GR1MEVz7M8OzjIaGlzgEC4sEtOIFqcmwMgRUs2jXTnLf/ OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3455c8r3k6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Oct 2020 10:47:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EE94100039;
        Thu, 15 Oct 2020 10:47:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FEB0206646;
        Thu, 15 Oct 2020 10:47:24 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 10:47:23 +0200
Subject: Re: [PATCH v2 8/9] rpmsg: Make rpmsg_{register|unregister}_device()
 public
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
 <20201013232519.1367542-9-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <b9cc4e3d-d6b7-8b2e-32b0-afc60ee3a2f1@st.com>
Date:   Thu, 15 Oct 2020 10:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013232519.1367542-9-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-15_03:2020-10-14,2020-10-15 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/14/20 1:25 AM, Mathieu Poirier wrote:
> Make function rpmsg_register_device() and rpmsg_unregister_device()
> functions public so that they can be used by other clients.  While
> doing so get rid of two obsolete function, i.e register_rpmsg_device()
> and unregister_rpmsg_device(), to prevent confusion.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_internal.h |  4 ----
>  include/linux/rpmsg.h          | 12 ++++++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index b9b34b416b7b..70de053581bd 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -49,10 +49,6 @@ struct rpmsg_endpoint_ops {
>  			     poll_table *wait);
>  };
>  
> -int rpmsg_register_device(struct rpmsg_device *rpdev);
> -int rpmsg_unregister_device(struct device *parent,
> -			    struct rpmsg_channel_info *chinfo);
> -
>  struct device *rpmsg_find_device(struct device *parent,
>  				 struct rpmsg_channel_info *chinfo);
>  
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index eb70463a9f2e..0b3ec18ddbaa 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -188,8 +188,9 @@ static inline __rpmsg64 cpu_to_rpmsg64(struct rpmsg_device *rpdev, u64 val)
>  
>  #if IS_ENABLED(CONFIG_RPMSG)
>  
> -int register_rpmsg_device(struct rpmsg_device *dev);
> -void unregister_rpmsg_device(struct rpmsg_device *dev);
> +int rpmsg_register_device(struct rpmsg_device *rpdev);
> +int rpmsg_unregister_device(struct device *parent,
> +			    struct rpmsg_channel_info *chinfo);
>  int __register_rpmsg_driver(struct rpmsg_driver *drv, struct module *owner);
>  void unregister_rpmsg_driver(struct rpmsg_driver *drv);
>  void rpmsg_destroy_ept(struct rpmsg_endpoint *);
> @@ -212,15 +213,18 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  
>  #else
>  
> -static inline int register_rpmsg_device(struct rpmsg_device *dev)
> +static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
>  {
>  	return -ENXIO;
>  }
>  
> -static inline void unregister_rpmsg_device(struct rpmsg_device *dev)
> +static inline int rpmsg_unregister_device(struct device *parent,
> +					  struct rpmsg_channel_info *chinfo)
>  {
>  	/* This shouldn't be possible */
>  	WARN_ON(1);
> +
> +	return -ENXIO;
>  }
>  
>  static inline int __register_rpmsg_driver(struct rpmsg_driver *drv,
> 


Reviewed-by:  Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud
