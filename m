Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5021E673C
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Aug 2024 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724096757; cv=none; b=cFeHysYNaeqpQQQM3KXN0YabGQvTwsAVkNQwsLfHixiloAC7H1FRpLP3uEHwHt9nQYPxft6Fffo2k+FWxQVCti/gQRjI1R5K5QjGvkNVruYNyZoCh4BLU0cLQjSZlsejICmr0w0M6lST7qeoSnmSQXj07RHKRFwkXOZOeVdGmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724096757; c=relaxed/simple;
	bh=lTecfPNxz/9Cag59+bTURN1jXiWeeVQ2ATKzC2brS7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZn1PSb30nyIMpzbGrn5VdU+qqtKnZCPxNHoA5ldFjP/NLpzt7i18AGqFdnKrzXT1sliSHoiAR0qjYH9EP9XAAw6af1XovXti/x8cHVr8Yk9k/GQHYd3rjhdXj8UmUSMEpuU/EP3lspmzFfhT5pKtM6bo3vIU+56VS6ebvqLYvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=gePwJZtm; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="gePwJZtm"
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTPS
	id g7YdskHFAg2lzg8K3sqpiu; Mon, 19 Aug 2024 19:45:47 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id g8K2sOJeeO7Crg8K2s5KuM; Mon, 19 Aug 2024 19:45:46 +0000
X-Authority-Analysis: v=2.4 cv=Pco0hThd c=1 sm=1 tr=0 ts=66c3a0ea
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=VwQbUJbxAAAA:8 a=YbEntRZnthKDSLyDuXIA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RUlAOFc33w/tmOT1t5JjZy4p+QioE0DcmaHZnwv7Dzo=; b=gePwJZtm8M0knS6ufjRJYEUmWL
	o5g2yEiytPKJ1AVmtnI/1AUbDseScBzOLSIrvIgi/XQt2jFYc9cY6+rbO2cYQkqkA1dQR2gYQRr/Y
	DDIEYOVzQYPOmzMf3B3La8aZ7qQSpoW+xJfuEhQn4VYaQTkhdWMx4tBmGZ7Zz+vyhL7vPvffSETvZ
	xQTsxZoPGsBOLgCBTYx8daTS1AA/0g/AvqlywqNTlKfXmvAi7nsKTItwwwBH4J+/wQ58YLE9/3Buf
	jnNIayW9C8MSi9wig+DE4KOSuA4Re1DEc+cpYdW83c0QJlrGT35tcwTlyLUbuXkXgOYDwWZ3U1KLZ
	vJrkWWJQ==;
Received: from [201.172.173.139] (port=48098 helo=[192.168.15.5])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sg8K1-001FC5-1g;
	Mon, 19 Aug 2024 14:45:45 -0500
Message-ID: <574744fe-4df3-405c-b4fc-7209d48c1dff@embeddedor.com>
Date: Mon, 19 Aug 2024 13:45:43 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] rpmsg: glink: Avoid -Wflex-array-member-not-at-end
 warnings
To: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <ZrOQa2gew5yadyt3@cute> <202408081146.09AA68D69@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202408081146.09AA68D69@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sg8K1-001FC5-1g
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.5]) [201.172.173.139]:48098
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBVSn387CnwNUVB1she9xV8jTqTe9oDwPslu+q0m3SPjOoWkBjOAPpClngh26TQ+kNea+/BTnWeFA+j2BAbqWKFm0SZy/en1+QFq6f1InLmbQkP9wwZs
 zpEnbt6YJAMcrSJZx3EevRGrYiIO6UFcMQwX7yqVzdHswjOpwFymOggBn23f/wJ+uiCytk+MZzd9Zhlcbs4CdmAJpqgkzWyolOVBx038q84Yos8LRuavohpY



On 08/08/24 12:51, Kees Cook wrote:
> On Wed, Aug 07, 2024 at 09:19:07AM -0600, Gustavo A. R. Silva wrote:
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> So, in order to avoid ending up with a flexible-array member in the
>> middle of multiple other structs, we use the `__struct_group()`
>> helper to create a new tagged `struct glink_msg_hdr`. This structure
>> groups together all the members of the flexible `struct glink_msg`
>> except the flexible array.
>>
>> As a result, the array is effectively separated from the rest of the
>> members without modifying the memory layout of the flexible structure.
>> We then change the type of the middle struct members currently causing
>> trouble from `struct glink_msg` to `struct glink_msg_hdr`.
>>
>> We also want to ensure that when new members need to be added to the
>> flexible structure, they are always included within the newly created
>> tagged struct. For this, we use `static_assert()`. This ensures that the
>> memory layout for both the flexible structure and the new tagged struct
>> is the same after any changes.
>>
>> This approach avoids having to implement `struct glink_msg_hdr` as a
>> completely separate structure, thus preventing having to maintain two
>> independent but basically identical structures, closing the door to
>> potential bugs in the future.
>>
>> We also use `container_of()` whenever we need to retrieve a pointer to
>> the flexible structure, through which we can access the flexible-array
>> member, if necessary.
>>
>> Additionally, we use the `DEFINE_RAW_FLEX()` helper for an on-stack
>> definition of a flexible structure where the size for the flexible-array
>> member is known at compile-time.
>>
>> So, with these changes, fix the following warnings:
>> drivers/rpmsg/qcom_glink_native.c:51:26: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/rpmsg/qcom_glink_native.c:459:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/rpmsg/qcom_glink_native.c:846:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/rpmsg/qcom_glink_native.c:968:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>> drivers/rpmsg/qcom_glink_native.c:1380:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Looks correct to me. As a separate change, I wonder if the strcpy()
> should be replaced with strscpy_pad(), but I think it's all okay as-is,
> since channel->name seems to be set from another fixed-size array that
> is the same size.

Yes, I noticed the same after sending the patch. :p

> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> 

Thanks!
--
Gustavo
