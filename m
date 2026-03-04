Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726E3372693
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Mar 2026 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615972; cv=none; b=WGnIZaaaGCbnDZnrdvH+Crelw5tsLvws4fZn+V5XBOQ65LIVW0GrsWwgeK7AfKLccaAG3ni8MR+ZxzKyrCHX7zFq6I2zGMhiOpCB9ZQKNwi9pGhZ6upIyRB0zorPICjyhQPahZdVcod7Vr+2JtzOwy42YPTNzade0hutS8YI8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615972; c=relaxed/simple;
	bh=CgUIX/j8xbNBZepU+kcoSbBhv8dHEWhS+UNWzvSI4TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSfwv4iVz78tC1CuFMtQp4Yq8Oc1sxlW8Dd8LjnX0ZOKHmG4UE9ZcJxceX/m3ztcDxQoUkTZNJoFyU6oXNS/fVeKdbhFeLEERJC3fol3KMlLA8g3nARmoc/jOK9+YvTcTKgzgZB2SYaofh+6YWg1omwGuk7r9HbZcNlkGq0R5Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuwAzi+F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPqHNVpI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuwAzi+F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPqHNVpI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SfJk2861379
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Mar 2026 09:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=; b=YuwAzi+F4fbeBVFB
	iREDt9xOK25QxQJrQD9qQLEEn7kx2IJoRsk3BfYgaRyb88tda99pF21X1qL7flJU
	B37R1lKTaD6s423Pz2yvng3ji646s54i1y01ONE5m0qTyIAMDPkS5Ns1sS9uL89T
	/dRz88Y/PXbreMlfbaR3yuhJ3svEX2/6P5MZkYjQIvuHJ+bIIkftl8UyKQO02TNY
	AzK+ubTyRCCYt4FYGWXG656WriKN4Rq7MuuvKTc10kgV64qh6439oWyGUsfDGgeB
	a2+QuynkoYxCj4v+hAMXmQs+/JlW8XFO4/ktDxvKBF4fGvi+cFKMIQm01XZbHfXW
	5r2cKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9kb28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 09:19:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fcb63705so13875026d6.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615969; x=1773220769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=;
        b=BPqHNVpI5jrQXhlBuFJjv0QZzmUbTXxpRVDxAiLdl2O/bs9Vcf9ZrqLfQjgsvG8KoI
         Pzo4Y07zPZz6Y0a96gX4S3pfTlOCrCLZthc8TAtY6Y4yUbKgRnQYUsfWfG3+UlEMy+4N
         iRhZm7OUdLD60YG2a9FakfQ4D80Ju3/uMppi8za92V+/GebmGHptk5j1evnrNFoEqYuE
         uidy08KS58xCg96ajjg92LsWAuNwd979T5iAk2M8HhdeaTqT+G2BN8vUZKl/VwxWFWxM
         PKfXoISs7VV2QPaoOP16T4wXzrl08SfeXK9LhP8WD9xS4TLrFcpgD3KUxSQzBNfBb07D
         xGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615969; x=1773220769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=;
        b=hUrrT4a/zZiXxfNBrSfSUt1EoVM6E9oiAK5UKslHTrFeNYpNCos2JmUPQ4KBiPnjVo
         75qpzuWf1bpRym37i+4ONS8hWuP+IPdlvZpO9/LgztZU2Q2balpGkJt1IBRPM/mUG2la
         9HpXWnm1GIldOF2JemJdEO9EeAyVzCjntjGyUvjHc4Kwl0askdmH/Zki6lXOm6WN/MMm
         5cI38L1ruCa7jwtXO+7Htb5SrdQ6waDHfCbhRoj1ak5XvAAJI1VtEztD78GKgUSJyOlS
         xPQnfSYLjncizUhBn+X34c68XEx+WM4faSby2FNpLkorPE5Bbf6myusqGOf6t0FR0ubV
         zMmg==
X-Forwarded-Encrypted: i=1; AJvYcCVMExExwizMAInZJnzxAybrlXSg4iAaYkDKR3rgXIgIyrUkRd2Iz2xCme2dHHoBAVNuh684SCGoa5SbGD4uJkIg@vger.kernel.org
X-Gm-Message-State: AOJu0YzpsC4XkXrosa/98kYqDoZrj4zWLLZ7Gq9EIgJnKMoRePAEd2Sl
	FXDp3OiolGH71KLF8O3iOHdJEqOVnerXb700tQU54fxVhoBfDqwxdwZP9UZs5k09O7xAQ3XkTU4
	B0lGKckK4eG9Na6/BcYTcZODlIbfBnFHfoUblBWEW0vl99cBuEaCIS7cyXolQJMZveNwUwjQx
X-Gm-Gg: ATEYQzz0hFWstO/ux49Enev2CPFRp1OmbIm1VPFTBQlRfZZbr8x+OmqOozpUTCSEUu/
	kKqk+NA3nDbxCTXxDxzdl8RNtbUJZzWK+mjGx1IuNxHy49+pMtRwrkBe58nifx11sQg1vZNa+eU
	TTiVX3cqFEV/vbTYvW9YNVZLoiSw1mIUO39GUFdwC/iUAowL3HsrO8VFMr8GTX311g7BtDELC/f
	39DaMqyQuatVnuo1UMDXMRrzXD/uvHkPAf2Wr4LbOtDsuS3x/HbLcyEzuf4lIEmXsSdhUxCrVc2
	OsB335Ma0q19nrF8tt62dbIusN86Yc/PUhTRnHftam7DcTV8jz+usqgySpeMgYdjLyGoPaU5fb7
	9skXPNbjaHEyZ+TObxrtLUTj3RwamB917Fp/ahTxRQDE3JiWfarn7e+Mb0BlrljvPzwxilsX30C
	L2xyQ=
X-Received: by 2002:a05:6214:8090:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-89a1998b809mr10047316d6.1.1772615968871;
        Wed, 04 Mar 2026 01:19:28 -0800 (PST)
X-Received: by 2002:a05:6214:8090:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-89a1998b809mr10047116d6.1.1772615968446;
        Wed, 04 Mar 2026 01:19:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae613ddsm716364666b.33.2026.03.04.01.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:19:27 -0800 (PST)
Message-ID: <e2fec324-c2fe-4055-82d9-f5c6aaef420e@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:19:26 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] hwspinlock: qcom: use new callback to initialize
 hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
 <20260303192600.7224-23-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303192600.7224-23-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2OSBTYWx0ZWRfX9bokouVmN8ye
 eOe666PdlrGWdNBhdrwvHJGv01wjhd9pegm4P+5KLvpeyIX6Exr7GeWng61uFjmAwsV5/Saq4u6
 snkLopNAQB9NTASCcnqJLBfVTwaL8SIHoKacvxc6+VQmk8WgmSqZMiFcO+Vi5cDAP1Z8nDutcGW
 7oTB+PHGrx+oSb/7qNugmXfIS7T9rH1WrgoU6u/g/sw3bSjjAeIPbDZRAC97ENZDA7TIeFRh+rE
 3rFwMzzEZCBbrWJ+zmqesxl/wk5huitCnUeU3z6AjaB2jEPYf33am45om5VEV9PNh/Q1SzIIbL+
 CHce2jwE6WAhciCoItgsZVnAdMR0cscKpAmPCLOgzKNZSJ4CrKvtMaVp5MxghakG5vyZ9PlEtRN
 l9s04fpVF/2sHqR3arnC4jn6ilcHRv2LpqhKgNugzF1JNwWD85Rn+GrAXPz88xHux3fcb1cIqBo
 kkUmYd9NXN5OO9XiIBw==
X-Proofpoint-ORIG-GUID: uQ2AFb7c6gEfVAv1ExJRWWF_ChLv3Kaf
X-Proofpoint-GUID: uQ2AFb7c6gEfVAv1ExJRWWF_ChLv3Kaf
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7f921 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8 a=7CJMOFuoybIo_9NlnXUA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040069

On 3/3/26 8:25 PM, Wolfram Sang wrote:
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
