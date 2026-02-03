Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4874531D744
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Feb 2026 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114462; cv=none; b=SC/2COjxCbR3TnSgxTBn+9huCkfy9Lj3wISNfaVnApIM0ZgMfR8LDSqgYF1jIw7V5JVzAwh07HvUvbVJjnWC+v16tIKUtDOoExeR4/OF7SjQnSFVUZXEfMYt78+8neCYsZGM5xnes0Zher1SLydT6kzptwsq/If6PTJcgcoP7WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114462; c=relaxed/simple;
	bh=sm4swtLpp0jO+bGHfqAFqDfa5NvVIHR567Hm1/qVHSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H73S+uJ/gRBzejmFED7yEnz1wQyW3+vVxS8E8hPeyYxV0Tvops4J+uLqopp6JT5sqkVmfqkc55ey/INXJwUODyI3i+CXE7FWQyQ2Y2GPQYfSbrNOap410AjpjJTkr7jSp1UiQ1pYgqLrnNTZEVn//pPXr5IH4WqnFwVex8Nrhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YA7ac40v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjR5ZgIY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YA7ac40v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjR5ZgIY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136oWin2884535
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Feb 2026 10:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sm4swtLpp0jO+bGHfqAFqDfa5NvVIHR567Hm1/qVHSk=; b=YA7ac40vZKveVnC0
	JIeKvKXMspHqquNAprDigZnWcQORD+nis84IpXb3tln0YfPA/Q7wpxLwmDA+mh1v
	8ZcmptC5NRwa0RKwoc/Lb5uo42p1IsFz11Fp40EzljsHCqzlqP68W+4A5G7J2OeW
	rdZJT8DjnxmId0wgXKyYNqXfN02d5FoPOfNDPRCoAxaPBdSrSK5H7pVDLFJF3+DE
	zJdZWD2L6rCYlKZNxO8c8OtzVRYzBWOqngwAaSnOgOwyal5oKkGaUV9Pjpj14TyS
	7fZKHG5bhlvOICGXYniKfqBAzEXT2EO2VTaRUuhOBGxFMC/LUG13te2QDrHvFsfJ
	HD4AUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3kr8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 10:27:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso127630585a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 02:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770114458; x=1770719258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sm4swtLpp0jO+bGHfqAFqDfa5NvVIHR567Hm1/qVHSk=;
        b=SjR5ZgIYrY0hvlAXpI3nd6sW03dbAuQzOD/pevxv1IGp05mSiWb098mGvc9cbkH6rJ
         MByXCPTGNCrZQtsMehGeS5I9CwrZB2G9GOBYf1L87K3Ju2ocx7+516GatxYemEdDk3U+
         F6KTRDrlIWsftcZbOLdt6PV1Dh5lfXE/ejIWqBu2jIbzv9KzqnPzjq50BwYZBgh0YCga
         TOF+0SoBwYXjEcOQxlWlSfPweJFBirZPqqtRK+bSD6qvUqSlfCHAJLLFfMyU5sVHsUUm
         04yQgK5KYCKBBI+o3ln/E5SlbxrIKvjdyYH6GNeZNmIzNFgohu2MWlOcl9YCvva/TNmY
         4ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114458; x=1770719258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm4swtLpp0jO+bGHfqAFqDfa5NvVIHR567Hm1/qVHSk=;
        b=YCmWKCSQwfk2rGJIjnhGgd/oYP1EaMnwhtFv7Ogy2RpqApjFwjbp/4aOq7P4/OvAW7
         hPOBxM1n0T+jbUOV/EwDnB1CRFSUKfBSgt8vs/ar+QVhwaDTH/vTiIjLxGrUz9PI4d7X
         z800Nq+dMYFrMS0lDG3meli2BY4fgGBXfTerVsHMJakSFwHkaZUerqBByihYusCYSoEO
         3lQO/O5MyEnguSSpoVgYGWWUc4eyVOpdoODO68Hk3EpoI1wJ0G4rv1p9bHwpKcpBzZ8d
         8KXXILTtPu8yzGCb88YEiEiQ4hQny+QV2bC38NfcFnXoX/at6quCLt8taWhGd6FqDazj
         +FnQ==
X-Forwarded-Encrypted: i=1; AJvYcCULPT+4ROMoMiLCVTZSa6maoI55V49V+7PHDrQX6fkXenBb+agyPClym4f2F+9KxwRYnthZtny+/LLu0Or2CZnd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PWVxvgiyidn9Zi+RiRWqkgQZZtIGf7J/iL0/VXSAX94JR5rM
	sEDy+NTE/2wcm+q9Z7eoLtmCZBxZUgj8qPBpL9Dbww1ZEIbYyHyr8hTayvBonOsG6W4EAmrNPu+
	qlyhkRroR4+QhX+0DCTwMEXBT/Zys2jmz074aMKe5c+gTsMGmx4ZkQ9JapoLkWy7AR/pxYrVQ
X-Gm-Gg: AZuq6aLK9NS65UhoBGXdsLGY1qCpBykS5i4KWnpEdLB7vm8DNCZfjCUDhElhOn2RcIK
	+LyrFpXtCasq6Atk1Wk+dRvJV09QHMVTkz+6QejD1vl8Rw/kFRpL4uNDVOK2tblJcVx9aXXqgCp
	/mt42hxy4JseIA7Ao592E4Bi1n3Q07PFiAYuttibu2gXFGCetxi2fWqlixBXTl7xHQmBL0wGPdw
	fq6GhI6G8D38bFkTu04WO0VZXcxRD+lSQR0KvinpU719A0ByUd6bAscF/uz98JsnoenhplHv2fQ
	TAq+Pwrrz1pq6au6pKsaGLauzgMn6lCOS5RgyX2UUD+Ac1qj+mWG1WZZ9+y4Nuxjxjnh2viU34L
	0fxwu24VZM5pPC8O+pzBZUBIBvN6JVZQed87v83p0rtiKvHbbfGQESKtn0f7tOWYCpQc=
X-Received: by 2002:a05:620a:a91:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8c9ec71b47emr1064472185a.0.1770114458373;
        Tue, 03 Feb 2026 02:27:38 -0800 (PST)
X-Received: by 2002:a05:620a:a91:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8c9ec71b47emr1064470685a.0.1770114457996;
        Tue, 03 Feb 2026 02:27:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b44530bbsm8663460a12.13.2026.02.03.02.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:27:36 -0800 (PST)
Message-ID: <c94f5bd9-07a5-494f-9924-cdc14eb3033d@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:27:34 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] remoteproc: qcom_q6v5_mss: Add MSM8917
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
 <20260107-mss-v4-5-9f4780345b6f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-mss-v4-5-9f4780345b6f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z0ZalJShpNOGJO5wvo-N1DOHjXrF0JqP
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6981cd9b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QzJuLQPmYQVcmAZsAwQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: z0ZalJShpNOGJO5wvo-N1DOHjXrF0JqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MyBTYWx0ZWRfX/hUZUBws9puj
 Nd+e6pTB/AaL9n5z7Y9xI9nWocwPm3A14lhTPWivZ2MEUGdW44sYltR53bafZd2Bd4fxGphtOxS
 1to0361dJpyD6Pf7OYlmSk6/3mdqbQqq4EmpTuK6Y1XLRoHzIrYn0134vwci1TDfUcxXmAGxbGm
 9qFn774goua47/xlBvF+oZddVfp/fiYxCiZw1vZEDWLaJzWzRszjgPpEIE0VOMacY+D1hF3I7Dj
 uULWP1GWuAvxkgxEs/I4/B2k21oC/n3Ys5ipTxIgieCH0vEv4exjQO3afjrbw8FAXWJhsktqXMq
 vsO4R+Do8cnazoLTPuiEguElP9/LpzoG5pYHiq63SD4PY4pgHL83qzuxagY2R9WrWJUxHSrtbcK
 +MseNnAfz3ojEJ2I5BApcGQvOKfPnszKdgt4neLqyE+JHFhVNn+vtoeWE5KE+wSTeOKCewrQRjY
 aGX2Y9N/SQcIuKBo2qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030083

On 1/7/26 12:34 PM, Barnabás Czémán wrote:
> Add support for MSM8917 MSS it is similar for MDM9607 MSS
> only difference is the mss supply.

Pity that we need to encode a whole separate config data struct
but it is what it is

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
