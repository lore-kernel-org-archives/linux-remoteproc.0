Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601092;
	b=oJcjTnEVYIczry2pbxSZSBor9rv1v8l6BS3e0fmVgXonouyaWa/YYZMNlZuamHlDIiHJ
	 L1p1OX2U7o5/iW1kRU3YoMR1Gajh/kExMXMq7zQtNRzwCyFQE4RxBlK+RqO/eVcsZY+D0
	 HZ/uBUzxmkrzoJ8HuaglxGU1y80Loxw25NDEtg0d6SnfIM9/CJp2nw0L/TCHPPzWSy8Ph
	 buo3sy+CDm6SRHEsDZDPCMurJdd1QY7nFi4R+mRbtjDgXLPP7NlB1djkENJBydfKpxmLS
	 MNCtwSxcz5O0joU4do2nU5DEUjmHzEWg/zLzu6menBAmSNM3CjtUi45z1NFkbIVQZSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
	b=pWheZ2kjLdru2+NGsRD7uw5kmI0NYe95JSbY4qmXxjd/ZpuQ6KbGYl4Cg2NFVwtnmBp7
	 xWGN1fSO2QEFm1V0WOWEX9njgeXwbsCvWvxLF1EEIWEO+n+hPtJZ6wcxcb7sxYY5UmCV/
	 lPtG9G0dZLz9teBV4MsbbToyq5+NRNl93o2dRgjue89dGJhkqCLRk7+cQOk3AZ3Fp7Jmd
	 vB/KkhpcIHiHyQ4u0hi2oOiwoHeJR+rPQ32ksIOOfDj4bEk/DDuZHA6Bvubargd0dwdo2
	 TcRh3Q3Oy4soFuoowhplrLEUPk7B1XzwFQ6rLikTe8biJ9xsFv1VmtS/0dYOQE8bwgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AWyHI9ZB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cTPPO0Nn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8396D606A321
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 10:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8396D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AWyHI9ZB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cTPPO0Nn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nmaN1505289
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 10:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=; b=AWyHI9ZBVqSnO/8k
	s3R6QLL3aKZGyrRk5UlNvJVHYDWxafTzttqw4QBV1iA96nd3BLw9fVK8FAJnZcqi
	axca9mszpX78SmLVrir0fVI+BBcl2NQeGrU+p4L5oPGPF7pWuS/qY1/dYpP69V8p
	9PUYs8SlGoiIgkE89vJ8aBQao+xjY0ntcNR0lB1uld1LyrFImjgg0JZHR1JKJY79
	/VJlLk88S7JXR72o6q2DPQ9YlPOTdAlNoLd/Vr7CJJhvJI6S/eqHVrVfU+5qXapw
	t+OcWzfEPAm/poP3YnUOt/OjeoQ01UaXQ5z3nS4xN0lEV9ejPKqfZHCLOVX+7hom
	Vjs3lw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29nm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 10:04:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495e11a684so37003385a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 02:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601090; x=1796205890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
        b=cTPPO0NnqHqKUDwYrHMKGsGrVX6rwWQOmjw7+9iRvAkrri1q+4LN0bAsBxYseoeE1L
         JhnYcHJbaBB/lg0+1NfB7oeHRT7SjOG6whF/HvRRT1vBm3rF9fVblrCHZNJ14ZdU+NqX
         K//NQguJvyebTmGacZjGFSKlJgLT6UXKOo279PMAMOqS7Ut/JkYbJJDN61RZomwwZ2ah
         bZBsrvzjMZENE5e2wKVbcFLuaghCEAD26Aq+0iZafiPjJeF06cnyL1ZGRBHEpKPi4kaJ
         5P6rcKFC0g87f5CVEklIIJa/oN57yskH90hfVoGnzFqQqoe62zF6tDOyq6Zagvpn3whX
         8eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601090; x=1796205890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
        b=OnSiXl0rvYZ1Ai6XLZ93Z8YSV/Zo7nYMw6Q/i6gRC9iB5gBTmDn+OaSqImDloFQX7y
         DQDOzaGF+tHQ0boS0wWGMSZwCMe23QCZfNWR1VVkYc3vzBqy77Nhc6pejqRd8B9QKUIR
         B8v9FsMkPXwNM9ZiY/A8Lc1Y0lsaGa4Jc3e7oeV5EYFuWzw5mzovgl4TXegMxdvcRbBx
         g2SJOH94KrWbAv/eM8Mbr5SUYEl8nEPqrS2rs3WKwXjnUYBplM6aQG/tl4i/ePicuo+q
         kv5urdxNmlplCFr/k0dC7aIVk3LQqGpCde2D1w1sZ8XO22ffdzM/Y8zo0Ov+xqLBwpZb
         nEJA==
X-Forwarded-Encrypted: i=1; AL+hErHeyBmOViRblUWaovn5G/Gw8yYmad3uqGCrZSAmXWDQZvrJm6XSXgbH3aQIQIMFzpJextuGO/nOc0JUdIDNxADZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+0XgN87cidUHz/srtxLiDWE+cscqa2+wSs2R//XWxujv+imom8
	YNG1d15w6HSmIpjfVSv1rIivN2qAgOF469WGwLL07La7LB79XNS9qXYTAmxB4bTnc+Cjk/iePq0
	V2+bGTdsaBwCvHI9oVDMDdsZy6YKsO5f46CQKv0HkrSf+9NMhD4rQHOD6hdc3IRMfXdWoHSpiHb
	H1wh4O
X-Gm-Gg: AZFdTZcN2DkfL//ab5aYFXiigl++B5CZJcrep3p6E5Gx/bh7/imK+YhsyBA/Xw2XvpL
	UNaE5Inz78GCwJkeFTd1JV4fP6PDnyHTO8IJL4o2StCMTh3r0+Eetfe6yet+HzR3s7hRC/TidzV
	ZnUaOPkEZ6GcS1E4hMyUeTgR2jlETBLJBhOZMFL/Rvkl1qR1eM/mC/RRQOXub7LoQtoCDQO10GO
	QpzjklWOyO0IrVVeIoTmO43wKjb/e2rdkf5FfXo/n4pYh8hSByYw2e8OgLcjG/Lks/qysr0z9T4
	pIbuSh2pXwjk0iQ9G9Cj0uVdlVfLoRg9fsC6WLzPgdcI262gulYCwq0sOTT272V5tBa6Z8DVVlf
	UQGtUICbVA7ArmI/NIIjEKce2BYyrsONQjS1mxJ32aGWCmadIvOGjPujE+IPzQCnkfXYL69Y=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2862182185a.6.1795601089701;
        Wed, 25 Nov 2026 02:04:49 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2862177785a.6.1795601089242;
        Wed, 25 Nov 2026 02:04:49 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01b0bsm614267866b.10.2026.11.25.02.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:04:48 -0800 (PST)
Message-ID: <439e3917-3125-4602-a81b-26aae8233595@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:04:46 +0100
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Save the need_pas_mem_setup
 into qproc
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JzBYRVaTXBLtcKpu0tTVrvjrP_R_xScj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX5CAcZch3SApc
 igx2S+JYz6X6SgAWTBiSCQsTfMBDi6SwL5VXMCnq/HZDGm24cYZTxpjEc0s3fcUQbAKXY8grGTl
 nU8TPjzw4/UcTVFsML/T38+Qzf/edJs=
X-Proofpoint-GUID: JzBYRVaTXBLtcKpu0tTVrvjrP_R_xScj
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06b2c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LNBVZBixs3kL4_gL8vEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXyB/1Nr9SGlAt
 /9XmDYsIitilXzOTmX3rOQ8zD66q9xwubXCFPLy0uBhGCKcRhkJIIfR5Ucsx1lBAfQwLfXpifN0
 CLRnzExiyCbvI4fQV/m1R75TF5NDz6Tuzbp86nNo1sd65VJZQgyShzXMcmuXbMCbhVmTMyTKzvQ
 Xdpj8l7rrgB6Ai1q2M2mbkmyH2sfE578rRXntitoOo/qcJG1maIEWUj7qdfqvmW4SwjaKl0+cYu
 my3P0czRXc7wSdABkBhfz5h78GRgjEJURGuqfUuFUeHXaBlqGU4ayXtWAIGuQNcnPlnu0GEhq7A
 KfxOm7yoYtxKewmLYw4fke6G9JahbGWRJkHp/sJdhgHO6LyffgsKm3FV6UvMadpeZVnvQiMt0PI
 jrE8yjJQZ629AuZalRZeW4F1i0S5U1pGpRMBlWlWvr5wL1+9EpVjiKSsm5EcZUSdd1T8w80KsL+
 d8cRZupc8FgYLaFkaFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/17/26 8:51 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> On hardware requiring Peripheral Authentication Service (PAS) for modem
> memory setup (e.g., SDM632), the remoteproc subsystem skips hardware memory
> authentication because q6v5_probe() fails to copy the need_pas_mem_setup
> flag to the allocated device instance.
> 
> Original commit didn't save the value into the structure thus quietly
> skipping if (qproc->need_pas_mem_setup) condition.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-83fcbc28-236c-48e4-a6bd-731f4361f9ae
> Fixes: f56052f4d87c ("remoteproc: qcom_q6v5_mss: Introduce need_pas_mem_setup")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
