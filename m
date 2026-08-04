Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DDF36B921
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Aug 2026 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856738; cv=none; b=jBV++Rezo5XEnNapoiJmHsFBOkI21byZ+aW2v/98jDbv25OWj4Xgf7rYBvn7pFLx6fZc1MKhkKsQz+czAW9oLHriLjnuqgvju7Sa6iOzTRwFDFZZsvIjs1mAGwo7p6CIkD2AGDnEgjicVuVxYKuP6cv68o+hsiV4MTyeB3y/4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856738; c=relaxed/simple;
	bh=CwrnEU3HCA+ZjLyrhS2d/ZHQXLlEFyFQmFNfnlbQTYM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VHc1NCNZOkugbksGhol3/kgzN8viaKll3Rkg85as5UC/6Zdu8J86gq7b2bC3MG/UY2V/kBIJUe5DKjsPqkrIT5EIWOhYvLVl56slITAbZuQqgokekyqW2QD3aG5dvm1IUy/z1iPc4uC3+b5e+YrrOF6l8iXRav6To4RWJHBDIqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgNhnbwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRZ6i6qb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgNhnbwk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRZ6i6qb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674D305r3693309
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Aug 2026 15:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=; b=UgNhnbwkMT42EI+T
	YKqvgAngxVINxcK2imdWH8ar9nSFt10ggaB7RHj/lTsRLlEwHmRxECM3Fgk/ee2B
	Xj04l/k0Zg/bXQEQD8brReeZUJJK1qwzSus75H5z08KZkuvmna7veARkSwLateq2
	Lr3xOSK5F6MU9oJrNtop9ud1zd4mZ9ViPVIe5PsQXGzVH6Fr/U2b/h+fS4f44dvn
	h9aKdR0WXnOJFPKe7VN1EIUHDj0NGVW6FkBFMQktj4tgWDkgnJBhC5IdoymVWX+s
	IfwR6FVejmfoJC4iFOTfobElqweveWcmgYxx+1LA8RV9PIJenUC/+OpT9lsppS+4
	+nIXiw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmggnss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 15:18:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1471254b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785856729; x=1786461529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=;
        b=HRZ6i6qblC/Bi33RiDMzPcThtBNAIReZuLo7yIBNe9x7dcXVNaiAMZ6z/GXA3kT8Hf
         W0l8CXjf9VDEeHsF+EYDRFZ62/U+faWy9rZg2DQd/2lfa0nI3TJZlCa4LpszURUvrhom
         iuc5uZurr2AotrlQO8hpcLgFC9tLbp8nAb/9qB4EpyUoG1ZgzdYt1/Lc5fpZOHoHuSZ4
         /YtZzzxpAQmkMGXDcm8AZ9MYQ6AZDcF4w0OOaXLhNsL/PWh6rZhKfHkUigZkAVYtQvOL
         4wqA/mCPLebOp2JjE+XhbuTpn4mCmM9EQHAFmSDDFgiNf064a5zlIniZM0uECJOoMnOI
         UyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856729; x=1786461529;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E180SL3QVJYB8O9OiTPj2R0g02zKzvX2cl+FJ8G5vb0=;
        b=Q1tHZet6aJy4gteJyHasrqH/8qbRMMnhpiTMUU/iGlgSXNcET5n0JN7yKpSJNC5H+o
         jMUiIUKapWy6UaVXt3+GhHtUusLb7NRTdlqP+K5nt6KRye6INRFVUMrA932iTcMjTDrU
         Ybl9fTMalVfmjyrgEscwdxk+YJ4JjGrEHGNXYnwOUWBZ0/cwbm/TUYj13sq7HR7bZ1xa
         7NSPvX/ZVbU6s/7QrgvENrYKv/ELEQ84i++lD83ChFI9afcnZQz3Gq5l5Yy/F1433dcC
         W8BF6PBQzhSwNH7MtETBy8/6vsgfCJE9Vt5K1UXo9v+CS93pRP2BjEb01LhpHn6qFlxE
         830A==
X-Forwarded-Encrypted: i=1; AHgh+Rrnv39ApuTwprPAWDAd9cVHs3zwZKbZJU12uEX1LQP4T0n8zbc8KSy9HL/Y5kxpCrsoIvsQK115E1vO21q7zRlU@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTXsBWobQK2Bsx8b408SsXYg4sJZBg5SyqzMczp1g08awX7Rd
	DmqjwwlBwUFnHG11tnGYNNGsOR/788lJWfxZaS3PSttRWIdsQeMFzWsjssCRO4n7T21mHnGSEjD
	ZMxTJoLvj7VNybfmvPVHMYNwtKkfl2yZm/V3ZQ7o63yMzJQlaDiTq36eVMXqO862u3egvYIcj
X-Gm-Gg: AR+sD13LAWIigoG+JtP54hNIvUZstE0kCWiC5GvI4RPALXIJ0XNeUuM/FlUwLIqZr3y
	Qwhfno5cp4wG7aZTEsOadRukepGiTh13hUIwijMloGNjVt6UF3BrjlFVv3/We0V/0tT2Ko4/Aun
	hX83nkLLhD22nuVrdMjM3xSvyM84kK+qRHp18k6fawmfh2ygMAHe0v38ICVsR7uOjurjatIglfJ
	bAEsa4J3zsu71Dvva0R5BKVHviikD17XbGYQTHkPcFQFnFBUAqdoOrkmO4mhPEFoAvcMqgLBVRK
	yiE2SbFPy2Fwpl46ULfFiGqDhqUnvclO7Hkd3tw3D3npsSBKTjBS89rHKr7tXugkSZnGjwG5EGX
	OKz0hOhx4olamvsGA5aJgXtbnCNEYtmBGTnqGaQ==
X-Received: by 2002:a05:6a00:3912:b0:84e:354:422b with SMTP id d2e1a72fcca58-84f2dbc97c1mr35154b3a.2.1785856729035;
        Tue, 04 Aug 2026 08:18:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:3912:b0:84e:354:422b with SMTP id d2e1a72fcca58-84f2dbc97c1mr35041b3a.2.1785856727675;
        Tue, 04 Aug 2026 08:18:47 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe5702bsm5531130b3a.16.2026.08.04.08.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 08:18:47 -0700 (PDT)
Message-ID: <c1f8b5bc-6d50-42bc-b671-7e91d76cb975@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 20:48:41 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>
 <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
Content-Language: en-US
In-Reply-To: <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyMyBTYWx0ZWRfX7spaAVDF7pIX
 79am2sY1AZ8czY3mftV5Y7MJZ9O23iIjxbV95a3Mmu+OClfRkei4sAZXIB5bbJGsqb2gTtKBrQw
 nUnrN91BmkpGIZ79FuNMlw/0kMsPbRrC8Xyurr/GhryV16dR7Midik6umFQZFZPDC4qB6HiZg57
 6+HykqK0mYVGA34ZmbHRJSCZrljjv35HcxU7eK7NzcO5XPwKdxojh39/jRAaRy+O0FHY0oh5Nv9
 07LKGgPGsJkg3Fk9OmMqID1qK/WJJFSiQnI9IpC1imcMf5Tl1hhOn+PjnW+kVoIxiaXSTElHJxo
 Xd8B39UfvPSe5YS2TesFPS0yn+g2D1U95opHJgWkXi2JXFMzeBdGpxAZttGhLfugmyrP29p9ju0
 BLYsap7feeSmGVHdqx7lH8ltTRx7rn4Dq7WmjPkdRL2RczDi+59p/Z9afg58rcCnobi9bVVAgXV
 cMAm9SqGptrt+/ALYRw==
X-Proofpoint-GUID: UntDnOfbBa7AGXyNV-7zKNlY-o7YmIwn
X-Proofpoint-ORIG-GUID: UntDnOfbBa7AGXyNV-7zKNlY-o7YmIwn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyMyBTYWx0ZWRfX/tRt5NrD2C8I
 5kn50MclZWz+1v7bHULeF0+Ftt/IchVYz8eBwASsD4sADCbYDqisaYfAw8ikvV2VHFHURGVoVM6
 Pylx2qUUd6rS7rC3SAOa/b2koGuCdhc=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a7202dd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=4pVsCTw3SaIgFaj2y6QA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040123


On 30-07-2026 12:53 pm, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2026 at 02:21:01PM +0530, Vishnu Santhosh wrote:
>> The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
> No, it does not. Look:
>
>    $  git describe
>    next-20260729
>    $ git grep bam-dmux
>    No child node shown

The commit message overstated this. The dt changes are yet to be merged.
I'll correct it in v3.

>
> Why isn't this part of Shikra remoteproc commit/patch? How any code
> could pass validation otherwise?

By the time the BAM-DMUX support was brought up and validated, the
remoteproc changes was already in a stable state. Therefore, the
bam-dmux change is being submitted separately.

>> node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
>> does not list bam-dmux, so any DT adding this subnode fails schema
>> validation.
> Fails how? How can I reproduce the error?
>
> There is no bam-dma in this binding example.
>
>
> Best regards,
> Krzysztof

Did you mean bam-dmux (the property this patch adds)? If so, I'll add
an example with a bam-dmux subnode in v3.


Thanks,
Vishnu

