Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2037756C
	for <linux-remoteproc@vger.kernel.org>; Mon,  4 May 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886430; cv=none; b=dP2D5tPwrmaNT/E2E9jvwbOzn09PeScUWBCCSN3BXrf7XGn8ytviCruqX0hoicu/3EZOR+8WpQpIAYCOLZVGItBlVVjEMW9U9TWzXYqquStpX8qXCHbwrO9RKkFjKrLl6K2lCNmdIghYJchlZdSr4LrrTIK1GE88VcDPaL6fWBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886430; c=relaxed/simple;
	bh=oQ9eG6ob+yWY+piBXjP6NuGOsypMkng4SMTY/pziYx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFZ7uEiwRxK9lNBBwIXGZybC7VWLExyOc67qzd2sPnlzLyMO0ZltMmmLBlNGJ7At6rs6FAeWt8DmGNKQ0t8GdhekNNSsCHuNqVHVXFTHf6/AYAlvGqFYMfKe6Um/GffDy+xVlW1HnhKhOMxnVhAT9Gs6UUTa8bWUrDoUde8sYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DP0rHUCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mdw8BrzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DP0rHUCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mdw8BrzG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fd4a487122
	for <linux-remoteproc@vger.kernel.org>; Mon, 4 May 2026 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=; b=DP0rHUCcKYKrOTU6
	4+YLLRO47dTK0k95xf1aJjr/zEC1BeU1ZmwbVwTfk2Ye9TPn12j56h1pFtCLQAC4
	KhYDjPtN01UugvozyOjlVSyzEjIoYB66OLruaOmkbrdsR/a9Vhg6Hi2FJsXBmucu
	yDxrMsQbSShgrYKrMJJeQ4yyShtgpm3+qErJTb2VGDsfat2kLJkr6Z+Z4OUiUPN2
	vqKlDgQNzX0Elz9mtysDKTIQ37s/uUxNiXnIutHnNZxaKu5x8xAVTDGN4r3tpeb0
	QZqvOgpCO2l4LK6eoDpj4XlHxYa3zhG6bviZdFoj+kWClXiGFA/uAZT9PvhmihHE
	XA/PQw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxn3r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2026 09:20:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so4520628b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2026 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886425; x=1778491225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=;
        b=Mdw8BrzGccVYD4tcjPgaLhNUkC+ofpzKlT7w/iGeJzV+ny9wzGeujkRpsiafQ2VwWV
         KVg5zc8Kci/digbulVY4K7oh5hseXoR5ApmBSraeaazgFPYw3nqrUCu9OMj3Vjf/0YV1
         5rU3tJ6QNRONqq4lUcGpDefC8W/9hforfPzYQ3wbXyJq4T0LNk4gHUAte1VUQ0WhB2QJ
         sAo4nVoi3lxcnTgDbt3bUUHv/eCwXBhIh+1qa9FCGzoapquZ/JGUlhC4bGzDl4VmyMlh
         Yet+BA7akKoj6O5zRPABCU7uhg4uh5NMmteoDy1jSq+XOksM8Hsuh3WAaRuYjyxL9MRF
         XEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886425; x=1778491225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xacEJq2Zps3FgavLd4lLbebjwrUmMkWW1Dnv6tEkWBA=;
        b=ccgnhvTNDLMhttQbNthz73vADYLKU3IejdzXLyu73oxlbWHDQdDYV4g55xAoE1oOtD
         tqycev3XeWr/Vdmz11NFR3iA5/RHg99bvfBsDl22Fbq5lY+gOTpO5qoztl5QK0jms6Mh
         N1VVlaOX6dSLTL/C+dl0WKuAWDh0J5p5CnTvMsWAdayBqIc+NsGD/srVI81jUHhEgVUm
         Hbq+3cCZWDnJbKamXCFZzelXPoFnKkU+jCh7ocaT3hdE8dM+BbLp9Ri26DLuUShsf/LI
         LzBKgBlnB0Y3I21j1YsAQAgDeoa5GbXzhzRehrW8zENfZ5ZtGGyIFse64vA9u58Y2cli
         gj6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/oAFhjqOeGuHgOIp7iTnCWOp8+xYuI1iswYEOIta6JvnSYzXaM8o6E0dsYV1BpiA/6N64C2ErhqX+f4XDvlVaK@vger.kernel.org
X-Gm-Message-State: AOJu0YzH4mNSw2PdI/fmlM874IsmRWzyCj8RGbXjgekgm0skZxjIcxFf
	zIN6LoYHxEFmGiyVHH3l1k57M0A+llwufOZZ24u06cku5N1r5MB36mFQDdiHwr0iO+MAu26lRFy
	Knwjd64I7aNwuE4GA7bNiB562pyZj6XTdizswUN2lfI0cxPkhkgPZn99SENJcxJavVB+0PrLS
X-Gm-Gg: AeBDietfkArw7GHDJPhu6SIF6PvU2bSw/wHObzFj2YJKBPJmu70ijWrnZ9tN71EuM2E
	P3tstFqp2RifL8zvhqZCxHIN8wvZTiOkBfcXubhccZZShF5q57Mjn3q3cq8xKriVBwFqGZqsMDw
	FJBnXfPziMPgM8XGAW1IJwVXxWkiWYZa9KBavzwehLSa0KKecxbI7x1RJMidlEqaoEAOKiTfqvk
	tEQmWIis6Mm/BZD6rp7YpMkz3PpPuAi/mJQbN7mw0jp9ciUOYXBIyCIfq5zM6fbzn9MUNYkpISu
	bXNkKDe+3xcQZ1Km3nxu5s2RFOL8kcKknENizL0LE6WlAIVt6pN8qKr3IfxZA0kR//nqKCZwlgd
	wQneUBqVIME/8WYEq+1zqxnRQwDQpHmTkArAy7Qybg/Tol/6a8m4P0OqITJiqnQ==
X-Received: by 2002:aa7:9f07:0:b0:835:388c:9764 with SMTP id d2e1a72fcca58-835388ca073mr4931585b3a.37.1777886425001;
        Mon, 04 May 2026 02:20:25 -0700 (PDT)
X-Received: by 2002:aa7:9f07:0:b0:835:388c:9764 with SMTP id d2e1a72fcca58-835388ca073mr4931557b3a.37.1777886424440;
        Mon, 04 May 2026 02:20:24 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm12316337b3a.33.2026.05.04.02.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:20:24 -0700 (PDT)
Message-ID: <81d83991-df25-4fc4-8261-6793ea9dc438@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:50:10 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X92ObcEXgzTxlOBqGNISSKp-a6z5In6m
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f864d9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DWWpLck2SfFL7czMIZ0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: X92ObcEXgzTxlOBqGNISSKp-a6z5In6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfXzf9H3h4nWt/x
 yvjbe1jjVyiMTn/hQvcZ8lDZ8l/JixTex241VZdLeYk04jlCJ+d0bi2sIu/1gdBeSMbgxaCpp5i
 foZJZT1GSE+STlObbhw64+m1iaUi/ZQmT7V+ihmPtGZo/XsfKE08/WmCN4ssyFjUZ2mnfn6oEUj
 gaWp0jK5LIw+JOgKu3OO2wzaB6hQ1YHsSU5a1kWxb32CH0zk79G1XzaCRwFLq1G/Z4IV9cILEs9
 JirAhYXcVfp/QK3Sd29GfZvvZSaRTrbczVETQ6iwf01hH36IqeR0aa6I8EbXo72V+x97zl5AvTI
 ZwK7xsCoOwyTTVyjTu0ZjYpagjpTB+26/4pJ1ykj12HP3tXkbssxk6dhtu0L+oRSdBpls2laBxl
 XpDzwG1ct28FGWCgXvEKFo+e3kjhgiUavS+j9Z3VunXOVv7AqE+L1NGakeAVgSOUZ39EnRxP/lb
 6E3oJq55h29GvSWuNzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040099



On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

