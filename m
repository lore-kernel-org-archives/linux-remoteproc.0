Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7841E6CB
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230403; cv=none; b=jef/FDanUUxhHzqYeGs2TAYnI39KIYRMXR4WZNofQMUio/oMxC2Af0C1KxK++jI4P5uilKJup1jgqypEowBMml0ucZsIn0vhNiIJ+CE7gWs5pNU8RfhCdqqP038cEvS0QeaNnaB0iZBZgSUyiGkSxoe1PG5480ZCQl/WSSUSaWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230403; c=relaxed/simple;
	bh=YeAz3ZiVICsPGo9HW945ctSIDY2E/S3Xka08U3kOzks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/pOG4u2NogKxK9hut81GsXZ4DC51q5EGX62+GL0Is6YmvORkWxeW117Beub49VxRJJHXf++pqx6Go/X/rzY8jzbB0R+l+NTqNnxUQgOz2lzx1Qw2n8p1CE0Am0KJ/NvJOYrYsI0+cOvU+8abPu6x+bep37Cp+WQISjjLL5lXC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8tyKFmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYNv46FB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8tyKFmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYNv46FB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82lm42275996
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=; b=Y8tyKFmA69KeOo0i
	nyr/7QZBR195o9tkJq9836onogJpj9y/aTuOqyML6JdJteb0oUcOPGnD4dI/AT3g
	8a7WOsCudM/w6jeDDlJ8bpXntgRAEKzUUamSI4eglpa6OfmMobVgjC1vj0rm4xvc
	izmUedJ1LK4CrUUnHHQgpt6EnMLJWSnohUmp9ZUq5o9S+X1zGGzMK7V14jQBxgQZ
	SKGbRewBZZH5GRaGJWSNmZJRQ/gvTHwlhyf0BdpeLY0qcYyJ1EgVDh27aU6kweEA
	o2to/zi52QJH+DWjsOcAYbEuMAGGc85kOpO4Hw1he3J5Wd+IAL4C9IEXbbiL/lq+
	lWd2LA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsue4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:20:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9d953b71so5023941cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230400; x=1785835200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=;
        b=dYNv46FB9ZSJR3itCDs2UMZKDmI9v/O2mccMFC0bTRRSX38fpAd4y2a0wfi13U0xjh
         m0K+rdl5LKQWchd0cYZfv2Sf9ecYm1qE69400oRQqL9ZWo4NkSSdYPmWOC5N5E13jgYC
         dtmHeRTpwr4jaZjzKjT37onB77Vf/YMZBl9LMh3Xm6sJhJe4uC5+0CU2ZIdQWfGog4cN
         gs9Panodxs8uz5s7CHZ57fc5Fjac3dOEhejKtXc1MA5IrmJGVMiLMvGRHBajrUc0DR6a
         E6nHmRB35icoBgVvxDQoVUctrPo9vJ50fYhMJrSlp2nnEEKJDxCojXNUSzVJnJ0ppyD+
         t3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230400; x=1785835200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=;
        b=a+DvLTTrpPqFChtTFL3L6AK8DL1cyyC0r675IAJDw0KqSbNupBR2QgWeIeSlTKj7W6
         WuEPFMiv5ywlzPnFNz5N4ew0EaguXPJc5s62c9l8xIPjC0qpsb2tingFYRqpJvC5r3uz
         PNnjeDwkT6rhewwjQ7fMdzprRGQv69cHpBed+FWVyE9cqbc/mA5Ieiu+q6yRkLhvRfOQ
         /oI5boCkARyI8orh+oW7Oaj8CWNojwTHffTfChw0wx0a4ARwbnxLpzbSfgbRkLdoLWCb
         Q+eZGT0OTh+ySuYY7kdzNEvYejzD5T6gSIGtVTEY+kIxu8kryRUPnsPZYINmZLJf37nU
         HUqQ==
X-Forwarded-Encrypted: i=1; AHgh+RowymwzEXpE8TS36ipo0erYv0WmgG4oDgKJ6P8EmcO/o2rMZm7Rkcq/IWLkZoHNNHkKxWan+qytxXXAkT7iWe9W@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9EBeIuS0uLIvCk7RXWXsMM1no/fkqn45VuFYhTrJqkDNI3oo
	/6pkrz6Zt3+Yvl5Q21Y4f5p6HSPDwLwBIGyeCe3FBEtht0KDCeHP9qs2z5ABB2eXiNoR/VB60W0
	ofhS4TgJnk2+OsjFtt6yrvExErrDsZlSXMGitgjaosn/HTV9WkvXaalpbXWMnK8+j9ufUNpnY
X-Gm-Gg: AR+sD12pk6W6y2YskEEjY0nyF6ov+2Q0l4dZDqYR/SL6q16ib7zjUSYLOLbM+fCx8oq
	XhO5SdIcgOAhqOhUQNZxNrJlV9f4ZPbnZQb3+2F9jAlB7gymN8CnQChzj9bCpA6mHG5cMh5/OWi
	zVizIMjxI0Z0IrMchwoak2R3iRhc23IE8zVg8ZXdJxR6PnoUQRGQeQew2elVN9u0g5HeALeznBs
	Ff+jpfrNQukTHjXe0k29Dr/R3KM/YsRkHTHQaj691gVHwk6wLQ8c+wrJPDfU7xoRin3FtGltqFS
	OgUUaBfCQDJKY5YgChkXW/+8sJqi/cgQGcueiPiEIXQkFK971+NRF4D2z7LdOyyqADe9DEKN/yK
	lUH6b2ZObWPNClT6c6b3PtqUr
X-Received: by 2002:a05:622a:58cc:b0:51a:d45e:638d with SMTP id d75a77b69052e-529d72160f5mr9344721cf.8.1785230399999;
        Tue, 28 Jul 2026 02:19:59 -0700 (PDT)
X-Received: by 2002:a05:622a:58cc:b0:51a:d45e:638d with SMTP id d75a77b69052e-529d72160f5mr9344611cf.8.1785230399590;
        Tue, 28 Jul 2026 02:19:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebcc4dsm751829166b.49.2026.07.28.02.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:19:58 -0700 (PDT)
Message-ID: <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:19:56 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfXzVhGvBbepgtf
 yXVYsKjBxKG46kTAGxuoTxJk5N9+KwKADhT4nS/lV+m0YsZg1tzZvkGyWBS2HwTDlZLlg/BtHw3
 cjrx8XHUth53k+78CMOU1oiQw28Rzr3tumiV4i7d+qp44xWFDHlSAsJcqBtBOXlUiSO8pTLKL8R
 xukqVlVii0XC6YvBEldP8w2uaqqKi+0wKG1R7+nvURFQBg5f98Ex6/0xDMZRb+83+5a6BgmaCOn
 i82yNOMl0veUZpf0Vo9c2Jxi4gON9roU5obQA9s4692NMwRifIZfAJYtIAco3mhqpyKl1OIeprw
 XN4TEtOqjv7Eme5HyoENtmIOXIr7XR9F3Wa1TbOL28PGNQP5MVYtI5rAvw1qF3Qj8qyoLzxshNI
 76ebbaE02CILW1Hnl3SPRN095fSCmDr4iQu2LJiYKDtfLSle4/128Ie7dn7TTZ8Xn3dmtZjz1Ze
 3f/UWFv9KrieAzyCmiw==
X-Proofpoint-ORIG-GUID: UGKBJKsfK2-GBZ35oHOPGxNFczPTJ900
X-Proofpoint-GUID: UGKBJKsfK2-GBZ35oHOPGxNFczPTJ900
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a687440 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3a8ZAtU5bMRv0GgPHFoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfXzCKccEwlMrGx
 7Q09eTLTrikj/0dX6IFkt97VggVI15O+rjFjfoA/wPM3NZpw066kbWltGMPJtauUGEQyS8n9unG
 zGNgAs/OkSOI5UxJuTP/kKN894qiRx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280080

On 7/28/26 10:40 AM, Shawn Guo wrote:
> Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> is pre-booted by XBL before Linux starts, so set early_boot flag for
> attach path rather than a cold boot sequence.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

> +static const struct qcom_pas_data nord_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",

Please use .mbn everywhere

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
