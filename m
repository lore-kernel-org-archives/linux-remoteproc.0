Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E88281341
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314497; cv=none; b=lyk0PwiDMkqjYGsJh0AFyPuMWFD56H85NecRgQMhndrdqRNJS+c8ib3GWx9VwU9NN86vZogtoqlb2OafZsLXxGjGSGjPDR5WbMuE59qo3snAbRHgNVY1A0Q2U/7r0Iy/WGtyZsIirXoSSW5VUujmFnu9C65weghTgQJdVyyosIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314497; c=relaxed/simple;
	bh=GEyvcU7FVWlyZol+s2Qczz4gRoztqnhhOrtCtAVsLOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hacmTOw/zI1XxxQXZvb1vACoYY84gfHdv4u9WCJApe7P2BEcbNwYchTjnG+8uTVl9y4k0oksDI+vRx5+ZMQ1/42d4lQNxRrVgIuOmkSWdxfWLWFCjl0I852wXQsSeSBFEKu49vfOv7BJo83UmZQ9YyzmMtUPRG/LWMS29KjkOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVwp3T1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UApvqlWN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVwp3T1+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UApvqlWN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBDeIh4164961
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 14:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=; b=HVwp3T1+/inN6BCz
	NWUQsSV3hwkOFUBII21ziJt1ElWKOqr4jhc3J+xyDv8PQ4QyntunGwkwBEFycXAD
	yBIpgkv1JpXwUlPLFLr7BzyQWxVVtcEQHgyRh8dSM/PL5MDaf4XPwU90CdJ6d2UC
	UgsU5flJ/56SlDpgrX9yjJySo8vL8KhK5ScP+PH+FrA5eABEaPvv58kvmB+yzDRk
	bfz8RLueBchiGRGJTNMjbf+wWKnHFSLXSL+eESk8//QKZtcs7tEWcKq5RO+KQQyl
	Lf7RydPuKsSdQMMFN8shOLjlp3C55Zcab5wGQkMHbT7oOBJYMOx3YZqU0hebQbBS
	IJbXKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06rj95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 14:28:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e518fb75so118280885a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 06:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768314495; x=1768919295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=;
        b=UApvqlWNOSvq4ROriQQha36tC8HzEdn6pfVP65CqXm8D1o6PkTjaUrBbjrJemsb7cY
         1JIor5BLAhtup6srfbPoe2QoF/8bE0u96s03WX1R0TbEnXbjv/FvLli6Bzpf3XLJqQ88
         fM/7uTK7tgxw4MM5WccjdcLctDni+NgPMr6uOtuZqzLK09WiHV5zgbkARwkc7IiKr5LZ
         tdyUMpQAQ/4U/frO4i1TxXI1g+BV7JP5f1disqsKui+dERR+Bmo1SZblr+VQkRcI4Jky
         9A4AkEN3i3b08JFyrUTorrQhjD5X83MBiN7+yVzMCs6hNOLfKkO9AFZ3kF+OH4iwP/cf
         jv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314495; x=1768919295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxqRB5HlWu5i21n6GBEu5rKuss69ZplhsDQf9AUqOAk=;
        b=KBF45/vwdPiWI7pZq8810RryWfejQDQMsH58rKRKL+Pqdon569OyTsUujAtqijk15Q
         AC/xraD4pwwBAe0vOGdAqmOWpIbmtWTmMHogm/09stRu5+YKWdsYwL0UPrM3x/4qN97L
         75KOkB/P9kqsew0qf20VL75xQZb6M6YFMqkw6Kq/BugTmthiP4tv3Jx7mPQ7sGf+03v5
         SRQyTZZwHjt62TXC/W5crkizpiZi6qmUUl2hP05XQaqFLEuucT4EZwnAcwE9pTTkPrYz
         7zgizw3KcEz+Eq0clMs7a4/mjmRedbMzoLCDp2DJAuDpMZfTI2G/5JXmgAxqJ+ZtPPfI
         yU5g==
X-Forwarded-Encrypted: i=1; AJvYcCU4YwPh1J4R8+Z7mqT+39qAJ2zgpN8Ey1hRzgvfMOykis0K6bOPhkHUBdeCd8ZTDdSnpQ3+AJJUBAv4/4JwcWAF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3LPyteagNc34UhYZ4IjP6hCuqaE6KwmGucjsLwgIN/Bo2v+9d
	Ap9qI/40YRNBMr1Wh4epU+L/38sgQxPo2aB6/ufkMwh+0ejTXDcDicFMMUDiokrMn3lVTiAr7dH
	+dy8ru0nAW+Ga4U2RLeQnbB9oa726OS9k653cmITwm7eYPJrNHwwPA29TKcPP7WyGZwAdXg6T
X-Gm-Gg: AY/fxX7Pck78SNRPJkGo8oftOA+xJkYhozHgPIAlQWPULQ8TGCUfGSHi1UQ25INhmYz
	bVKfLCWY8BS04HGCUwrBfuM7NT6wxtfp51xVAy6Pif0dF+B4q97JRobmM2bCWA7IMT919JxIwX0
	g8E5Xh7SKMaY7W1aS0kE9iKo3e2/C9Dy38EJSTAmXuKrjFpp4w8xJ53iX4jkU81C2Wki/h8PrsN
	nXl2otN29jx6rAg3Op82MgkOjwrnqlAgCoRqtJOEMFhuVpscMIj5kd6L9RxYKo5OEY83KWlgMah
	YPN1UI/pR/iVxog3enF8UjXkTk+4tYIFpkjM/DRpDwOng/AXtHn0gSiL9ug4SACLzsYEwAttSP1
	UjucRtP2Fg3lQlvFSPghuP8tXUlYrTYx21dMQ3LyWcj0nIauqSkkVksdMBpjeGWMBzvo=
X-Received: by 2002:a05:620a:4107:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c38937c1bcmr2193464085a.2.1768314494852;
        Tue, 13 Jan 2026 06:28:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdjim0AtdFV39wYUK2oZNSJKlSOGQXB3wsnGeW8nI6+rx4ttssUu3p3UZw3cHWQcxqBahbhw==
X-Received: by 2002:a05:620a:4107:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c38937c1bcmr2193460385a.2.1768314494383;
        Tue, 13 Jan 2026 06:28:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a563f73sm2305390866b.61.2026.01.13.06.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:28:13 -0800 (PST)
Message-ID: <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        krzk+dt@kernel.org, mturquette@baylibre.com,
        linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sEkWc3L_l1eBZ7y4WSJuGlWkBgBhPXk9
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=6966567f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9AGPOYKhFRli6DSTmn4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sEkWc3L_l1eBZ7y4WSJuGlWkBgBhPXk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyMSBTYWx0ZWRfX3VklWVVzNLwE
 r4BYsrZv2comFHXUCmJW+fCefA4sHpG0lWjmMuv3Q0V0XlA7sWcN86VimXj8/DUpeLj1xq6BRXz
 bEvEMLQdUifi38anBxWnleT0UvlEmGVLy+ylcBoFr4wGgW4QS3W03Ee7UGK5VNzjbHW/6bVWQ6z
 /17S8SH3EqUTAfEt7ZZXLi1bI7u/75/tBsRVc19P7ZYdGYKDAL33S3Ne9ljgelhjC8Vg8N0qmZU
 a7FK3uoVxchGcEkKXw2+/fSwXjVn/tEy0gAOwtPYnPAWeMJMu2q65YLNeq59RVFmBgZBLNZx37V
 ufFUxGWXkCRyUwoIgsfQiRh9On5Z1sNM+Cd9n4Fn+jtZGV+kyBzEkSSzpAjxZmOSM5VVhvYnGtV
 xgQnYkI70ZZGLGGcwZH6PZBK+wRJMo8TqVBO76AoM/19koQKi1+fCjwIxmSNoB4SOJ1MB5Etfyz
 NiRl32O7FOD78/mXsmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130121

On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> driver. This firmware is usually used to run ath11k firmware and enable
> wifi with chips such as QCN5024.
> 
> When submitting v1, I learned that the firmware can also be loaded by
> the trustzone firmware. Since TZ is not shipped with the kernel, it
> makes sense to have the option of a native init sequence, as not all
> devices come with the latest TZ firmware.
> 
> Qualcomm tries to assure us that the TZ firmware will always do the
> right thing (TM), but I am not fully convinced

Why else do you think it's there in the firmware? :(

Konrad
