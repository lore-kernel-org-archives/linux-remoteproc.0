Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C842613D89D
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Sep 2024 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726215047; cv=none; b=PgMwilqjfdoYd6Fe9j3kXJVBxN6DZ2d+vBAmk6DXtt/xpwVYD9xo9f+IuNpxCfKeQkPoiN629FYN+YDySqOMbc73viy01L/Ee00Jeco30aBD/MU1pSv2RsWXXSfk8rMasQCu51eOU0Or8OaX8mOikbIdN4L8jExIRpPVk3sntro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726215047; c=relaxed/simple;
	bh=bm0JrAOh22eMu3dJ7cStSs9X0hitNAj/hOSXsbUVBd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFKk0ULl+8nfd3Jmpc6GB+l0HX8Rtz44CEQPT4csgNAEYi6A/r+1snOdv2NXTBLVXngJoeGTwfRa7GH+zsAAh7xGZAw4YaiuzfzhJZLqRaHUpAMq+ukePbzX5jQsqvcwxXstEIXbYKjZcsOOdFh4H8dearQuDa1xQZHxhg2OlTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=YBSvwQun; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="YBSvwQun"
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id p1G0sjInTVpzpp1O9s5zd8; Fri, 13 Sep 2024 08:10:45 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id p1O8sIwMFks1Pp1O8sbegj; Fri, 13 Sep 2024 08:10:44 +0000
X-Authority-Analysis: v=2.4 cv=Ud+aS7SN c=1 sm=1 tr=0 ts=66e3f384
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=rpUMG24A1zG+UrzXDtAMsg==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=9OA2k-xDzDUK-BUy8SkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1G59LJMSYivR08X+18CcLBybb5tZQUn1LSKdgrtgB30=; b=YBSvwQunKc8b9LdviI/QHVj+1t
	X5fVKu0Ox2tyTnevFtmhS0YDWNy1EioVVaJ0mtpfxlhcU7RkOMTKzcB6N/X80qMZxAPLHD5O2vQt7
	LYs9OB42/E40q0iCdZZeH/g2LBWWDdVYC7p5NC236pfEky/z+v57lQCUa0bjOp6XuFgo6JrWqVams
	yIyd0GSgHv6Hrtbo4YF/svTpnR8UwrwHavQmRwyiqBS5eH17r7yESkNqLwrHdktpr6cGuFQF2R9PU
	j/lKJ0HnIFCMoE1TrKpK6BLubY6nHNfTGnL7TbgoqVF7GS0A8R900PMD/bcedfGKCZmCzBmJyw0XC
	GXlKuCtQ==;
Received: from [185.44.53.103] (port=32866 helo=[192.168.1.187])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sp1O7-003nYS-2g;
	Fri, 13 Sep 2024 03:10:44 -0500
Message-ID: <5a438394-ae88-4d72-a56e-6886d06b0a84@embeddedor.com>
Date: Fri, 13 Sep 2024 10:10:40 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] rpmsg: glink: Avoid -Wflex-array-member-not-at-end
 warnings
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZrOQa2gew5yadyt3@cute>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <ZrOQa2gew5yadyt3@cute>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 185.44.53.103
X-Source-L: No
X-Exim-ID: 1sp1O7-003nYS-2g
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.187]) [185.44.53.103]:32866
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 32
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE8+yVWR4iVmrGWYB424jwbTa4JMMf6iPHBiXyCM8OMxWOcJ2fr4cl9SWtcB99N4ykyGaY7fG3B+mBuVqv345PDnwm28avEBbK7xRVtIUqiqqqnURq9U
 XSwvklFsa9TnB76rcDWerXALNY9ecVlsyTC6S5atoKw9PwOZyAO9Pm5RJw+8ncKFRLUTC9NWi1I44jJEAn33tfhUtUC2c7Mn1yqPgMDPLS6hvascxH24GYBO

Hi all,

Friendly ping: who can take this, please? 🙂

Thanks
-Gustavo

On 07/08/24 17:19, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> So, in order to avoid ending up with a flexible-array member in the
> middle of multiple other structs, we use the `__struct_group()`
> helper to create a new tagged `struct glink_msg_hdr`. This structure
> groups together all the members of the flexible `struct glink_msg`
> except the flexible array.
> 
> As a result, the array is effectively separated from the rest of the
> members without modifying the memory layout of the flexible structure.
> We then change the type of the middle struct members currently causing
> trouble from `struct glink_msg` to `struct glink_msg_hdr`.
> 
> We also want to ensure that when new members need to be added to the
> flexible structure, they are always included within the newly created
> tagged struct. For this, we use `static_assert()`. This ensures that the
> memory layout for both the flexible structure and the new tagged struct
> is the same after any changes.
> 
> This approach avoids having to implement `struct glink_msg_hdr` as a
> completely separate structure, thus preventing having to maintain two
> independent but basically identical structures, closing the door to
> potential bugs in the future.
> 
> We also use `container_of()` whenever we need to retrieve a pointer to
> the flexible structure, through which we can access the flexible-array
> member, if necessary.
> 
> Additionally, we use the `DEFINE_RAW_FLEX()` helper for an on-stack
> definition of a flexible structure where the size for the flexible-array
> member is known at compile-time.
> 
> So, with these changes, fix the following warnings:
> drivers/rpmsg/qcom_glink_native.c:51:26: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:459:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:846:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:968:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rpmsg/qcom_glink_native.c:1380:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/rpmsg/qcom_glink_native.c | 42 +++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 82d460ff4777..ed89b810f262 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -30,11 +30,16 @@
>   #define RPM_GLINK_CID_MAX	65536
>   
>   struct glink_msg {
> -	__le16 cmd;
> -	__le16 param1;
> -	__le32 param2;
> +	/* New members MUST be added within the __struct_group() macro below. */
> +	__struct_group(glink_msg_hdr, hdr, __packed,
> +		__le16 cmd;
> +		__le16 param1;
> +		__le32 param2;
> +	);
>   	u8 data[];
>   } __packed;
> +static_assert(offsetof(struct glink_msg, data) == sizeof(struct glink_msg_hdr),
> +	      "struct member likely outside of __struct_group()");
>   
>   /**
>    * struct glink_defer_cmd - deferred incoming control message
> @@ -48,7 +53,7 @@ struct glink_msg {
>   struct glink_defer_cmd {
>   	struct list_head node;
>   
> -	struct glink_msg msg;
> +	struct glink_msg_hdr msg;
>   	u8 data[];
>   };
>   
> @@ -455,12 +460,9 @@ static void qcom_glink_intent_req_abort(struct glink_channel *channel)
>   static int qcom_glink_send_open_req(struct qcom_glink *glink,
>   				    struct glink_channel *channel)
>   {
> -	struct {
> -		struct glink_msg msg;
> -		u8 name[GLINK_NAME_SIZE];
> -	} __packed req;
> +	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
>   	int name_len = strlen(channel->name) + 1;
> -	int req_len = ALIGN(sizeof(req.msg) + name_len, 8);
> +	int req_len = ALIGN(sizeof(*req) + name_len, 8);
>   	int ret;
>   	unsigned long flags;
>   
> @@ -476,12 +478,12 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>   
>   	channel->lcid = ret;
>   
> -	req.msg.cmd = cpu_to_le16(GLINK_CMD_OPEN);
> -	req.msg.param1 = cpu_to_le16(channel->lcid);
> -	req.msg.param2 = cpu_to_le32(name_len);
> -	strcpy(req.name, channel->name);
> +	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
> +	req->param1 = cpu_to_le16(channel->lcid);
> +	req->param2 = cpu_to_le32(name_len);
> +	strcpy(req->data, channel->name);
>   
> -	ret = qcom_glink_tx(glink, &req, req_len, NULL, 0, true);
> +	ret = qcom_glink_tx(glink, req, req_len, NULL, 0, true);
>   	if (ret)
>   		goto remove_idr;
>   
> @@ -826,7 +828,9 @@ static int qcom_glink_rx_defer(struct qcom_glink *glink, size_t extra)
>   
>   	INIT_LIST_HEAD(&dcmd->node);
>   
> -	qcom_glink_rx_peek(glink, &dcmd->msg, 0, sizeof(dcmd->msg) + extra);
> +	qcom_glink_rx_peek(glink,
> +			   container_of(&dcmd->msg, struct glink_msg, hdr), 0,
> +			   sizeof(dcmd->msg) + extra);
>   
>   	spin_lock(&glink->rx_lock);
>   	list_add_tail(&dcmd->node, &glink->rx_queue);
> @@ -843,7 +847,7 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
>   	struct glink_core_rx_intent *intent;
>   	struct glink_channel *channel;
>   	struct {
> -		struct glink_msg msg;
> +		struct glink_msg_hdr msg;
>   		__le32 chunk_size;
>   		__le32 left_size;
>   	} __packed hdr;
> @@ -965,7 +969,7 @@ static void qcom_glink_handle_intent(struct qcom_glink *glink,
>   	};
>   
>   	struct {
> -		struct glink_msg msg;
> +		struct glink_msg_hdr msg;
>   		struct intent_pair intents[];
>   	} __packed * msg;
>   
> @@ -1377,7 +1381,7 @@ static int __qcom_glink_send(struct glink_channel *channel,
>   	struct glink_core_rx_intent *tmp;
>   	int iid = 0;
>   	struct {
> -		struct glink_msg msg;
> +		struct glink_msg_hdr msg;
>   		__le32 chunk_size;
>   		__le32 left_size;
>   	} __packed req;
> @@ -1685,7 +1689,7 @@ static void qcom_glink_work(struct work_struct *work)
>   		list_del(&dcmd->node);
>   		spin_unlock_irqrestore(&glink->rx_lock, flags);
>   
> -		msg = &dcmd->msg;
> +		msg = container_of(&dcmd->msg, struct glink_msg, hdr);
>   		cmd = le16_to_cpu(msg->cmd);
>   		param1 = le16_to_cpu(msg->param1);
>   		param2 = le32_to_cpu(msg->param2);
