Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE2255F5E
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Aug 2025 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571360; cv=none; b=tSsc8RZvQoN2KYFaykjLhOv5UJJaT8OlyG78kW6zOxgQOq+HmCMxA9s2/76661KULB/imJHuZFWk39xvMnuj051h+xV45sgHay24cvganpgBStKinfBWxxsWORyoZYOfgjdokqxBsFoX/csZrRQ4T6tv2+Na646nljMNtil+ljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571360; c=relaxed/simple;
	bh=cmLTJCu08IZdkIuuU/IBxWNBdqB/J5DZTkvRxpPHoTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrpaiwsRoJx2Yru4BjHYvxGKe56WUyUsY6WHYZlNXuKhGU/S6aKu6k3i5M+A1qwo0PGWI6LcTPLOoRCRe7nwjZlGiLgs29txaZMo7vhLTfTwB4jZlZuyO1LyEZXO1hZPRemUcDTY23H9sgQOVtOdy9VGri5PT2i3iId1zsABYTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ5kBhJB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ5kBhJB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DANM020466
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 Aug 2025 12:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4bMHXUEWO9j3LsN7dUEww8s9G0HlpeNdFt7tEVo1/4=; b=XZ5kBhJBZCEgPH7H
	gzINhwRyPPxJbU7Yw1GDvZN1Puxr6n2Pe7YVYSr2JdeBee2FkZugEuQLwjZXBKax
	u8LoQ8Lulo2l+7gPreA7Jw8hhyY3dOaP1F++R+jQJKZWGHapg9p8uvayZoo9x8TK
	9tRWYPFfz4jZhlbe5heY6sg/BhURBbvPL0WjlVJNeumEa54aq6qlN5HWLt99bhra
	Ref7HJ52p5OkSb7wpZ2p2ZgZgElLIaggwfEmqq7Hv2Zgnpz46GLiYaKmigC5q1/t
	Y/Ek0jhNN2PKwd/gqITedJLJVqwp+JeVVjj//SUAg/R4xxzUDpkgjzash2QNRtnT
	mWtjbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8e9yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 12:55:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4abc1e8bd11so3325071cf.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 05:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571356; x=1755176156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4bMHXUEWO9j3LsN7dUEww8s9G0HlpeNdFt7tEVo1/4=;
        b=D7m1OirYGqKSLJ6LT4JVPl2/p/F+x27AEqrA8xzi7amg3Zlr04R39/pvQ45w0LzN5H
         p0uYkSDZJ7/1qutiF45iJriw9MRt9eOVajnqddHGGc/JPDUOAeb8TB91fFM7jLvUDz1T
         pxxffR7JzKE8nI7F77I9upWDkoU221ig5qpXkV90eATS8Wse3iwHu3UyOXwLM6ZUS07k
         eFeno1drTs3YScQuqmsNKxV4u+27KU1UYblFZ8d1oJ4on9v96b2dhhVOs8MPymlmWNhC
         7OkGYv8xcH6UxSZAOCC45pVwWeDwCi0a6b/V3LXF6FwhMz8YAljDtIpv2J+99JLKFlto
         E/6g==
X-Forwarded-Encrypted: i=1; AJvYcCV7VHqq8ytS1pTE4RcQEpw/gjOzex4FqMhRjF8ecG9Ucmt3LjcuVEARZ0+95F1fBk/VFCEXzCuDN+h/syRr4/MH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Jhhlaw6P7e4/vDkUqUUdgthjk+BXdZbZUf/qbwMVjfXQB713
	kHmAoVMi2njo1kUizFqaZwOVClJ5fJcEGHzNK1eEsFUFEmFbPTngRQ2n9FCsFIx1/eXjAcjh3y6
	Xo+nmSjw4E6Kr2YbmIL3qfgO3bz1e2W6vIJhxpuRwn1tBqG693mQdUanWisDjlEH2oKJwbuoL
X-Gm-Gg: ASbGncufDoEFmrNjW+qmWabbCFerrHMUxhVDPs+wrLRJ6q/beOIpN2VvjsZ18vPKM9a
	wqWBBHzLB8uOgsIGXufe1LtioP/ATnxEFaRebwlEpwzGJE44CCLf8ICqkZWl5dnRXuuqMam6Hu5
	E8ydTRGftzYHG+1gRqXFdpkcF76gB+/GoxQ3GUU29Ovp2HqfoYisnAb2rQRLeaWzPVvdtRFwSHo
	NoSiS0sCi4KX9tA2ahRwmnLPk5aqlh/BUqi08pNeP2rEeo4ApLboQasT3Vjy/52UsV6bmhyGENm
	uH0nX5mp5pAdBd7pWYPF5cGkA4kEuNE/1evoBh80OSIjpbaCrloNfG7ACbkVjpCbw9EGEbRLOY+
	GnJclcuItxm+rFUrZ4Q==
X-Received: by 2002:a05:622a:1aa3:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0915d7c31mr41550161cf.12.1754571356145;
        Thu, 07 Aug 2025 05:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwbcsceg5/p61lAf2t1TB1KGC8pzQd5z817hJbPD8siowrxZQPY7hCXLhIuHIXx+wUv8hceQ==
X-Received: by 2002:a05:622a:1aa3:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0915d7c31mr41549941cf.12.1754571355647;
        Thu, 07 Aug 2025 05:55:55 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm1298236866b.117.2025.08.07.05.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:55:55 -0700 (PDT)
Message-ID: <38534c32-7e37-445c-893d-3624bb59981b@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:55:52 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250807074311.2381713-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fCyXrA9nNZx24vE19-8kW6s9bYyJdOaC
X-Proofpoint-ORIG-GUID: fCyXrA9nNZx24vE19-8kW6s9bYyJdOaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzB88WQZBhcCZ
 2Bu/MkMf/u7KAfuW5PiPfV5v3jfxwHKFttpfu6lYij3r9Tf29DeOIBAY4K2eXNptRb8lDg9Ioln
 iLJzrRDsIJMllqZULpN+9tT+eOz7Ll8jTlDJEzFaKOON4IltBqtge+iNH7QVZlEuc2ffizbnCE5
 ljZBzqRpKnBFF+59jxm/CfGxTj74cJW1QdXZ42KYHnHYCjkupQwucoRZxfR1YKj5bBf+pcSH/ZQ
 IOQgVG658lVbAMcRu9ugpL5ZHViFxsst84TKfFU2muB6b34nj/DmvJlBCMSqYiq52z+XhhoYphR
 tohKQyCRpbfhTIuoxNy6Ret7iw7Jyte/bIRj7Y1gEjDa8Pkjk2Yw7W1l2SiU99BXYH4YIBqdPYM
 BzANt3mu
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6894a25d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/25 9:43 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/ath12k/ahb.c
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
