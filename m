Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513B0C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 08:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7A34218AC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 08:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="S+X9lM1O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388348AbgJOIsn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Oct 2020 04:48:43 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:52784 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388282AbgJOIsm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Oct 2020 04:48:42 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09F8l3iL024871;
        Thu, 15 Oct 2020 10:48:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=jjfPeig1mby3E/hahbOyXAhB1N7XsU9GNoeGmjs0sbE=;
 b=S+X9lM1OwTPmA2KQBwkJWsKnJVjYwGt/Sv1hSpInGE4MknyflyyQ+j4EEbiHcb4Pcj7j
 Mp3S51R8uqoAJh9iu5cgiIx34aOVuN1w5SL2Qc4nuxmkVmmSa95i4ESK2bG6ExWAjKxb
 NY8PnddAuJ/nL5fUKhFtAnexW5cwucbhnphkGPOeZEYoW3yoEJKK9WsiXFdTEs4Z7UCf
 JHk6tQS+ncTFCHT1EDCsUsqmhuPf/34Qiqw1o+h6spwZmKGFqkhV5kKmtH8VAT95wMun
 m7ZdF97ZaE/RrHErNGfQgDVBixBxn8XK5r227kA5mwef7hdTYinz3KDUx7TNeRUh7VKL qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3455c8r3t5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Oct 2020 10:48:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA9E410002A;
        Thu, 15 Oct 2020 10:48:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C879F2067E7;
        Thu, 15 Oct 2020 10:48:36 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 10:48:36 +0200
Subject: Re: [PATCH v2 1/9] rpmsg: Move rpmsg_endpoint_ops to rpmsg.h
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "guennadi.liakhovetski@linux.intel.com" 
        <guennadi.liakhovetski@linux.intel.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
 <20201013232519.1367542-2-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <fe0a39c8-e6de-74da-d60e-dd35ff794ef1@st.com>
Date:   Thu, 15 Oct 2020 10:48:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013232519.1367542-2-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-15_03:2020-10-14,2020-10-15 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/14/20 1:25 AM, Mathieu Poirier wrote:
> Move structure rpmsg_endpoint_ops to header rpmsg.h so that it can
> be used by other entities.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/rpmsg_internal.h | 19 -------------------
>  include/linux/rpmsg.h          | 24 +++++++++++++++++++++---
>  2 files changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 3fc83cd50e98..094cf968d2d3 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -18,25 +18,6 @@
>  #define to_rpmsg_device(d) container_of(d, struct rpmsg_device, dev)
>  #define to_rpmsg_driver(d) container_of(d, struct rpmsg_driver, drv)
>  
> -/**
> - * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
> - * @create_ept:		create backend-specific endpoint, required
> - * @announce_create:	announce presence of new channel, optional
> - * @announce_destroy:	announce destruction of channel, optional
> - *
> - * Indirection table for the operations that a rpmsg backend should implement.
> - * @announce_create and @announce_destroy are optional as the backend might
> - * advertise new channels implicitly by creating the endpoints.
> - */
> -struct rpmsg_device_ops {
> -	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
> -					    rpmsg_rx_cb_t cb, void *priv,
> -					    struct rpmsg_channel_info chinfo);
> -
> -	int (*announce_create)(struct rpmsg_device *ept);
> -	int (*announce_destroy)(struct rpmsg_device *ept);
> -};
> -
>  /**
>   * struct rpmsg_endpoint_ops - indirection table for rpmsg_endpoint operations
>   * @destroy_ept:	see @rpmsg_destroy_ept(), required
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index 9fe156d1c018..9fe1c54ae995 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -22,7 +22,6 @@
>  
>  struct rpmsg_device;
>  struct rpmsg_endpoint;
> -struct rpmsg_device_ops;
>  struct rpmsg_endpoint_ops;
>  
>  /**
> @@ -37,6 +36,27 @@ struct rpmsg_channel_info {
>  	u32 dst;
>  };
>  
> +typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> +
> +/**
> + * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
> + * @create_ept:		create backend-specific endpoint, required
> + * @announce_create:	announce presence of new channel, optional
> + * @announce_destroy:	announce destruction of channel, optional
> + *
> + * Indirection table for the operations that a rpmsg backend should implement.
> + * @announce_create and @announce_destroy are optional as the backend might
> + * advertise new channels implicitly by creating the endpoints.
> + */
> +struct rpmsg_device_ops {
> +	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
> +					    rpmsg_rx_cb_t cb, void *priv,
> +					    struct rpmsg_channel_info chinfo);
> +
> +	int (*announce_create)(struct rpmsg_device *ept);
> +	int (*announce_destroy)(struct rpmsg_device *ept);
> +};
> +
>  /**
>   * rpmsg_device - device that belong to the rpmsg bus
>   * @dev: the device struct
> @@ -59,8 +79,6 @@ struct rpmsg_device {
>  	const struct rpmsg_device_ops *ops;
>  };
>  
> -typedef int (*rpmsg_rx_cb_t)(struct rpmsg_device *, void *, int, void *, u32);
> -
>  /**
>   * struct rpmsg_endpoint - binds a local rpmsg address to its user
>   * @rpdev: rpmsg channel device
> 

Reviewed-by:  Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud
