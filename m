Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38651A841B
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 May 2025 04:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746419408; cv=none; b=S3RmbWu1jIj6BVedeP9lPMk3A9c94Qh/CK6KAY3m89yWzD3bVF+XfxwaeZ+pfJsXgMMfMExSg3U4iNSgfn8OdKHFzSzT2Gg4UKkOCAsnAfut51SzX2xpz/1yWn6TtdvDr5aW5vbx1wag5vD3oX4WA1i7OC0RCtbuOjMXtJ4X318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746419408; c=relaxed/simple;
	bh=tat/UdOeVW9y9E5UvXaU8Epq8XucIiru3S2OvjCiOjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o696SvrSBjefaapKOTzdOBkAfaIuaEC00a1//ZdR+c4yECi4BfzHd2qxcNpRbTK9fHrd5763r6SqANp5xKe4P0Vd/LTMiZpn/2DBSN6QQMnNEyZlfZ3I0zty9ffnCQKBoIrMwLESw6cD3OkeQb6iTElvcvhTuGbJkVhf1ywJ3oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHomb34U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHomb34U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451iEcH011686
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 May 2025 04:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RT+Thy0QvLCO4okTddVASjhzNC6Tj2+mPt9xU6TKuOo=; b=RHomb34UiVgOC5K2
	9NiA45A56iqz7xDXjr/EgzN5mTO0YQrwnUff82B7vZdBGBmKjYIKhOQnXM+MlMN0
	JNlWdgKaQD4owkq5l/rji1iquiF0QWFQ+fR5pZdud+5+rzM0C25A8p/55k17Hzso
	C3oMjQ7rjfbM4F1VmUBSoXmEU8GLHTbSPEPJRDPeoV9ILgdqTSR7RhqF8Df11Ne9
	s+xfInsU6X+pzzRmwDFGRx+17sm/5XRa5vnvX6IN6kiUdXkKNAlJnc6xQYtXC8hF
	X35gXKhNkgSmUhl1jAg8t3TD5noIwbZPWDvgwSr1xnxMsDQxh/IAyqnBHljJO/8S
	Tio9EA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55tygt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 04:30:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-309f0d465bdso6257115a91.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 04 May 2025 21:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746419404; x=1747024204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RT+Thy0QvLCO4okTddVASjhzNC6Tj2+mPt9xU6TKuOo=;
        b=DlMIyltFcgcigQLvUsf6I3M4e4KcTOxs2C/H05i0T8t2rDeQxq2rj100HccF9O74X7
         EjJ+GjpOFTTh3nW0hRuPB5eyUAqZIQIKQlfGOSIFSrdtGUz9Xt/1zUle2KT6WITZzJHW
         AIu1oEaFMszWwI1f+xMB4mqdufubNbXzUrUoGrDkuiYRNmocHg0k9aXfJgl+DKdB990r
         yawxMEIcABTO1b+nqoiMlTN+3/FTKBXNbwRjRmjKXnl8Oqg3dn1mLd21h4FAMYksacoV
         9VVmqYiPZkYWLuRpOta4vHEfyRRkrd8d3TDrFUGGAK2A07bDCgZtv/MK+MzIDPYaN2xL
         TDfg==
X-Forwarded-Encrypted: i=1; AJvYcCXziCDGRAjeAHlTHBu4/JZbN4ORCoafcC8otnywVuvDKcftMnCR7WhzVDFAfXqe9OLcAI0ToKl/esYv2TomzmDG@vger.kernel.org
X-Gm-Message-State: AOJu0YwkuV77f7Zu/A4pqM2ezXWhB/AFgcofFoLpPROXRSuG8m51A6dB
	pNz3BNDUBfqAufiU+967sFDiDHVYXs264IHVkJwESwBdFmcvZ3Tlv6JVwDQ7cxXAI0x4dqC1EhG
	JupYWnkQp1N1GUx02yMr2y6WeEU5r3dEj7q/48tdxOc5S/O3Bpm+kUWckmCO/EHBsZM8r
X-Gm-Gg: ASbGncuE95d5e/AT+ulJOe6BFpEieOtyQjlvh9Wr5IkkvRaxDnnp0WtEjaaMahbTrZz
	jNeqhyQck3pomfp6xRiZqr0xZgXEbpbzLAepvR/ZsKc5r0T0DddDWfaCKSRP/joKRSc4k8mInxc
	9b0+vVNoqWUSh2fx9NlaZmS8TDdgidxhT2ABP+Bu0jHMZvUE6YLV72+30WFtlv9xpgr+kr2knSI
	ZixymwsLk8iYzCsNs8PKCQlwYSZXky6OgkOeG/pG2oZI8WuhmJ5cTdct4tc6ktj9DODmVBdF1Jx
	mo4EnH16t60atX6deFMg9VOG8SpFjhXA0DzzKnJ+
X-Received: by 2002:a17:90b:3d50:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30a6198dbf4mr9352647a91.14.1746419404077;
        Sun, 04 May 2025 21:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqUmOMTDYpmv11950TW1BS1e0LDkivXBdXi//Md6qRiIa4KrFjTB/t9ogC6F9TPBb4UttJXA==
X-Received: by 2002:a17:90b:3d50:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30a6198dbf4mr9352620a91.14.1746419403762;
        Sun, 04 May 2025 21:30:03 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f8c1sm44772135ad.246.2025.05.04.21.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 21:30:03 -0700 (PDT)
Message-ID: <3d03e70f-b1c5-48f9-9aa4-421e48ff7c7f@oss.qualcomm.com>
Date: Mon, 5 May 2025 09:59:58 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-3-gokul.sriram.p@oss.qualcomm.com>
 <23f0efae-9d37-45cd-85df-7122843fece0@kernel.org>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <23f0efae-9d37-45cd-85df-7122843fece0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA0MCBTYWx0ZWRfX/aoS/iZmG/PH
 FmJjNmJUFFMSRAMdgk5HFmVrnB+wbxn292jH6ocHQLrmV9npWn2foZ3Y7vAinEh50dx+AXny4J7
 c1GjVolZfo8rpMPbtZ9NhcNn43SSmYRrAYJZG/LrzS7wXZNh7jfE7oI1zvn9RzfZlfWzotAygV+
 a1/I9uqzuGDsfvokohdjOF98C9SXz36qxzsdYLBxClmfp6VKcQSxc4fsnOZ7jAw9tGgtTLVp8nJ
 xQNo6mJ5h3qc9F4teza295Mg9QJlF98qsNo3E8B7veldCBvQN4gEWtPGwTx9F2N+fTw0F/qYHvg
 H0wgJyUFYE8as33godLH/MKms+clYlma2WBOX9zVAX8VHTbr87K5eYfCSartjoPHN4bhNLahat4
 gWwIqJz5hnw7aQHNflyGZ9jl66BIOJ6/Z15qsKxMxDFFBXlT8wTvDz2I6WtunTmIKTMmzvwC
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68183ecd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=lbk28AChQbnHTQvtX8QA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: u4naxuZVh7RJ3B6sk294xy2mDVgNVXSW
X-Proofpoint-ORIG-GUID: u4naxuZVh7RJ3B6sk294xy2mDVgNVXSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=820 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050040


On 4/25/2025 11:52 AM, Krzysztof Kozlowski wrote:
> On 17/04/2025 08:12, Gokul Sriram Palanisamy wrote:
>> +  interrupts:
>> +    items:
>> +      - description: Watchdog interrupt
>> +      - description: Fatal interrupt
>> +      - description: Ready interrupt
>> +      - description: Handover interrupt
>> +      - description: Stop acknowledge interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +
>> +  clocks:
>> +    items:
>> +      - description: sleep clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: sleep
>> +
>> +  mboxes:
>> +    maxItems: 1
>> +    description: A phandle for the TMECom mailbox driver
> This is also a new property.
>
> Phandles cannot point to drivers. It is just impossible. It is a phandle
> to some device (as in "device node", but we describe here hardware)
>
> Anyway, either drop description if obvious or use simpler form:
>   items:
>     - description

ok, will update. Thanks


Regards,

Gokul

