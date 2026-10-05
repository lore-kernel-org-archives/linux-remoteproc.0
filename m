Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507064CE69F
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216765; cv=none; b=gj8CxaVnd4Ab2iDUuS6h4QOaThxLQDD5y7F88aFUblqdKZ/nj2b//vU4+o36swdq2GjdrZdzQpK/InmwZyoYAPDYL476UYn2WiXJw7KHwtZnKAIRqGKpL/dnLuAT5ggJ/Ol8/Wyjds8F5oz6Rj3wBYCySUzBTmz7H92qRy4YVaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216765; c=relaxed/simple;
	bh=pGL7OPUTou100s2Ao9RAWlBCSCF6/32S03caCjf9SXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2iYLjHxMCFE90hnZ+PWdGLg+zmvjFPB7EkrbuyZ3RH/28YZTGq5erQQzOMAlEbswgMwbkWinEy3xnR6aV+tC7pQAfkHabNBmMflinGLWZSgHO6L/Z+f/CcnWLNXZgiZDmakPIzxqVnIP4Vp+xJ0kbYgVl9Tnt6Wh0/8dLRXyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhxtBiJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGQZBudJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhxtBiJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGQZBudJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP7TW2651596
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Oct 2026 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pZuZ1lDBf+lhAoCkovyGqzsT
	No9dAJ7sm4hyDqgMjos=; b=YhxtBiJE0PD7HIsh8JT09+Svv9Ve9wJcUsbOrLFK
	rxSegQ286TGsSG4AaArzLQGDRQUMXcIB2pB5oDvrJQljFZH6SUAdLNPkouCwtYjB
	Cx1QNRSbq2sS0YlisU50NqaGTcqVXHqEryO2bnV6QVlTH2Z+TC1A1N7eA8e2RWir
	un7DNEyZDH0MAxPO0WrE8swC3qjZ7/o2PzCSZiEsdLfx4uGSAaEygn3QgRoQVe2j
	6zXzPIYt/IFhmpeupcJhKk0GJTM1fb2ybtAIcY/gWcjkrE0FGFWS3jGR1nRy2y74
	0uJ2JPOHs4sbCDWcdJCfx1OZMTPOt1/v4Uyfcv4B8yhEbg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvs97h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 16:12:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d62bb27a1so8091819eec.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791216752; x=1791821552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pZuZ1lDBf+lhAoCkovyGqzsTNo9dAJ7sm4hyDqgMjos=;
        b=eGQZBudJNvB4yKmFbmWQPJO62nSFhmu+t5TSSf4m409ohKJtQVmvIiei/MordFwLvL
         s7FXM44eRgCZU98OVZtNFNxIeOmnJjozUqRTG5arpMf/U7oLFgjMoSvEq4luWz55FsEF
         45h1rf9kzZvBFZSLCHOoc6rcnua9RKnbL3wyUr8VY9PDTgAZPANFy02UrqwE2c8DAzd0
         oXm+XnD/fqTBsB8Ny7SkWgo5yHz6O9/ivKIBQ1MxbjnUsu3l4e5d3p7mz2C6WcTpwd+T
         Qx6YiK9y2+e/B/QXCg9qlSIUpqYLZcNdjWoHIQBO5qjp8yeiiVc3KzAo78rqKbXqSTJX
         hcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791216752; x=1791821552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZuZ1lDBf+lhAoCkovyGqzsTNo9dAJ7sm4hyDqgMjos=;
        b=0kfeJzFo68R5p6357MUt306P4ldMMMoCLj3e5349mLAofYF467E+SrU6pydttIR7ez
         vEjRPNOvi29Orr6dJSckkwLSE69Vri1hsDTpOdYeux8Kf4I/mFZrmmHW4pQGgS96Xe9g
         +BXTjRASa/UHYrVztCCkOSuZl6E07uyXHGat7ckQo5hhywL8CIJzCUiMMKjWLvsJV5U3
         oneAQt0vNM1d2PTYNMXMG34IP63uVbrgyP8wXo+XYOTdqoRdxxrDYKsDw8DdlR/PTJC9
         WR3WMuyJ2WiAJmhMVoVcYIhO9UNFKR1D5+lV9inaNtAQNnmbZ88H6qPI1fraUWqfyHw7
         sA6w==
X-Forwarded-Encrypted: i=1; AKwUvByfwTQnYfX/QmoNmlCFQt8CKkLIsmO01xRrzEnZm5EzVkfrFUhfedfKikMAdxVIGeW448UdLZluY1ZADbxgCPsm@vger.kernel.org
X-Gm-Message-State: AFuF++lePQ8Os6q1Dqnru5EywAjL8c2yyd33v9er02dENlug9fxX4YVu
	rupttowYpzya9UEED1atvmQG+6JDgqiMJThsk7mtJERNl7gp+8DvkE5MG1L42LiF8VRWt6XwTHU
	OZqzugLSXkBfPAPNy55fhkAKE50P20HmWmNth465Pc/jObGtN2N4B7YkFheb/vwf1wxb+nl/R
X-Gm-Gg: AYBFou0GSoPR6uvPaeF9BJsPakyvvF8As9I8uRP2K2OlP2BC1ymxsmxV2i0k4XD3xiN
	UDsb5JsKPcMbHHnpv7ZB4dl9G668QueRkDaLRdar79u6BJzguoxJyicJsAm+dyizXuVRgvAoFNX
	vK4fIHk/gLVDs2pkirk8pplSMZ7d2hAtF+QOe+EnDCn9yQ09XsY1uLh9V+gNzJ+2PyU9RJPqSp3
	iKeJtNvMOGAgxLTT+hE8HHG+o+36sRAecKYGPWgshGccX1STEuKxHixwwojcXMa4oWD14eJMEBy
	efDtro3rcuI+O0S3FzXrQXzPCzL9RpbmNkcNv7KvHes9gZSc2gyzNtpQadRcCqfQxJGUABkoRm6
	wHUnp4o3wdqWR6URWcVfvjiuPMw==
X-Received: by 2002:a05:7023:889:b0:144:f096:4dd1 with SMTP id a92af1059eb24-151c492533cmr11482399c88.41.1791216751907;
        Mon, 05 Oct 2026 09:12:31 -0700 (PDT)
X-Received: by 2002:a05:7023:889:b0:144:f096:4dd1 with SMTP id a92af1059eb24-151c492533cmr11482362c88.41.1791216751113;
        Mon, 05 Oct 2026 09:12:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127021d1esm15885013eec.4.2026.10.05.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:12:30 -0700 (PDT)
Date: Mon, 5 Oct 2026 21:42:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, sumit.garg@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
Message-ID: <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac3cc71 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nURcFc7YoTJHLg9ZjdYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 8C8QTP5bXsPbMpn1ZmU-AJqpPN74pD_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MyBTYWx0ZWRfX6CmYYU2+cbfz
 LCw08cdoBAwjxFo9pBR8Dc0oaESyrhTrMgvYuSh7Mi5GGj73F6pxw0+Fn5aZqd+w4G4Zul8byIU
 zynji6dkqUUaIrqMP/vZ5SsFJaHZn6nBLUfXF/RkEN83G+B6a8f77JWRHl6vxx0vW9axqMF7Fwa
 FytK5cXu1PCVbDZH4uWkaieSShuaPeBUojH7z3jIqBhcWoIgfif1a1wcG5AdbIAvbDFQ+a4zldM
 T2ZR5QiXi0QxMPHnkzJ4WAo1IiFaFmxE4gsZtSpQ9mz2FPL93hwGuJ60GIRfH1WhCwaWfey3C7e
 /3cE97tdLwCAv45OhOw+u7TZEDiK20LWiuKOpINylXZNdZSa7/IdXfzViN/ST/Y889NEOH9rulH
 qrVy/oD2BhS8BhNlhEhD3cb1Y0dZ7F/qklOoeHTsGf6Hhab31HTWbyXqjXU/j6C+JfWFeN7a42P
 P76l31FmrMYOB4Djexw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MyBTYWx0ZWRfX/+d7YGmOjO9+
 hOIfQqDJbuLJt0rLQgCUS0HzOb2AxT4FyyY20tP1IDpaLZYStALiGjmlZNlNPyy89fr/GTNq5Qe
 nD9gSDTqa0wrd6xmZe1xe4vm0TLwuSk=
X-Proofpoint-ORIG-GUID: 8C8QTP5bXsPbMpn1ZmU-AJqpPN74pD_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050063

On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
> The firmware resource table is passed to the PAS backend even when the
> firmware carries none. This only works on the first boot, while the
> cached pointer and its size are both zero.
> 
> Stopping the remote processor, or failing to start it, frees the cached
> table and clears the pointer but leaves the size set. The next start
> then pairs a NULL table with a non-zero size.
> 
> The SCM backend substitutes an empty table and hides the problem. The
> TEE backend copies from the NULL pointer:
> 
>   remoteproc remoteproc2: powering up cdsp
>   pc : __pi_memcpy_generic+0x110/0x22c
>   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
>   Call trace:
>    __pi_memcpy_generic+0x110/0x22c (P)
>    qcom_pas_get_rsc_table+0x38/0x60
>    qcom_pas_parse_firmware+0xa0/0x100
>    rproc_boot+0x2d4/0x380
>    state_store+0x40/0x100
> 
> Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..e871e03ba794 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>  	struct resource_table *table = NULL;
>  	size_t output_rt_size;
>  	void *output_rt;
> -	size_t table_sz;
> +	size_t table_sz = 0;
>  	int ret;
>  
>  	ret = qcom_register_dump_segments(rproc, fw);
> @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>  		return 0;
>  
>  	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> +	if (ret) {
>  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
> -
> -	table = rproc->table_ptr;
> -	table_sz = rproc->table_sz;
> +	} else {
> +		table = rproc->table_ptr;
> +		table_sz = rproc->table_sz;
> +	}


Earlier code was intentional please read the comment below.. /**...*/

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..5edb39ad5277 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -504,8 +504,11 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
                return 0;

        ret = rproc_elf_load_rsc_table(rproc, fw);
-       if (ret)
+       if (ret) {
                dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
+               rproc->table_ptr =  NULL;
+               rproc->table_sz = 0;
+       }


>  
>  	/*
>  	 * The resources consumed by Qualcomm remote processors fall into two categories:
> -- 
> 2.54.0
> 

-- 
-Mukesh Ojha
