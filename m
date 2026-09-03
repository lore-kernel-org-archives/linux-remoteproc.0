Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152B440632
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2026 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426318; cv=none; b=lNuEKgrtbYhTniEtMoAJr+oBWJRHo53aZf+JQASJEzvrPvGsFkPeGkxgzMFKCkJjHKS2TGSxxcjfEtSwjloiscKh0ytEX+nZm8q7MPlTPpSMUZIlGr2cL6WZH51gIjHdk4ruQu5fMGfysEpVh39ws8RbMHCHioZGUYzpgDrYXXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426318; c=relaxed/simple;
	bh=1ZFBwN4O2Tnlfpi2Ys3/dlh9ftVvt7IonIdLG60fN5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qm/QzySnqwlOa9PUcVSKKlZC6iGNGA9XzEho3fDNTw60tUCJLdv3wdSd9nxjeS+8dzCzNfIn7m66OVRFel/67oBQSH9XTb2J6LYjgzsAEKqsLea1ROCpctgUAPFX11yK/tiWrQL2pS4XbJLVDiefvP59joLp/L51lWR9gTmg7+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRnHNCwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GM7R5T8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRnHNCwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GM7R5T8C"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392Shl4187640
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Sep 2026 09:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UIAGfBApybDy6Np2y/KdX9quRVrgGs5YTAz7KoZkn8U=; b=eRnHNCwDtU9+IpxN
	VddEf6WD3xIe9dvaCHophKdTK8NP5iEoa3aed1Rpy9TCeOvV5NIuxNHnmGF+Dpw3
	j//1nq1vznIET1tlVwDDgtc5S949+9Ta95VgIWLE1+kQtS0dutW59+CkqHRkytrM
	uAJbnvHH7ErvtaRcVWGtSI8lns5AEqIpu/iBTVczWpG15zyxA0NA4NLOVOIaLTbk
	tfTqtiY6DcpBREIpJBTZyaDrKStA4Y4BJq27ia3LyxRGCNdpfWy8j5p+iVmvaPYh
	eIB7Epf7Yxp8hRPPjySmh32WCs4aV8+xhkBf4X+sglUyT4ZzyiUyz/t9saZb7JQZ
	vI2zHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5uu1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 09:05:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390890ae83so45441985a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 02:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426315; x=1789031115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIAGfBApybDy6Np2y/KdX9quRVrgGs5YTAz7KoZkn8U=;
        b=GM7R5T8CigW++rJYAreA5+EELwjWfZCTfN/OhHKaLIKIpDDnN4N0L24BsBPfylvT9+
         75iiFLx4uL8+FwhYiC4nI3cI2c6bvpfbU69lL+5rDmWxZqVJnESRVjaZAwulkBccMdcY
         ilKAgw2vnk8yoSEd0o8qfPXEp24VA08So01yf3H9R8D1AwXZFWox/D3FdYZ81FNeWccG
         0ypscgKNGWr1upV6yeMzJFBTjJdUeJO0qZgjHLp65kpB7VC56ZFIu0EBoc5zX1wdHRUk
         aUFKvkleoodDYhSqamo0mV5V6/dlvzSX5Hq5lqdO9ATBUY/dGrZBEI9MEZlsvEApBiyd
         BZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426315; x=1789031115;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIAGfBApybDy6Np2y/KdX9quRVrgGs5YTAz7KoZkn8U=;
        b=LcFWvgTJHSjV/68ZzmdHehm1ozv7jAT84JQYQ+xRtvtG8G5f5+4g7FtoA0n3qAa8CJ
         IO7r+oe9c+EDz5/fsbAYDj7bLdFbK8CrzpxZnRGrYYp/GMoREHjayIDnXE5shzkTc/eL
         4l1lmErt7unZHnHovYyS7+Zw2s0vkZebmXYcr42/RaJ20gB2mgXKHUNLCKIoGlU937RW
         cjXmu6Y6MzAsb5F8jIQoBFBfd6tuCscOv2Ryr0fYuopveM03FYmh4qTwSw+y9zeqrax1
         XyL/3KXCOY7TPdO5PgjxIaOeoivQnnyfqxapljTPbDNdLNo4iJxrwfktLdVCyWO47kbv
         YNJg==
X-Forwarded-Encrypted: i=1; AKwUvBw2kfHkFvsbjAnlEk9ibfsp5rSytt1r1lxcoIZ/RQcnajyzaSh5uijDMkck+Zi6BGQkp7Ua0LvOec7oLoEFl4s6@vger.kernel.org
X-Gm-Message-State: AFuF++nOqDNjCrGR55/5pcnhwDKwCOurMPrjvNsgfdfJGS7ZkVp/j24a
	HNn7pR1ePJ5oE5uwu/YStLiAWCXVuESpgE7U8Yr00s63sOry1JSjjnX9Up2oRlvNSN1iCS+ixvp
	h1MbVwHRFiDMHZIkv9AQzmo5ZpgJ1v/W4sxcZF22heH/mMkVQ3pj48G6Zf77jLLxfnRAmPmkA
X-Gm-Gg: AYBFou1m3yf4StSboeH+w5l7JtVBlpmKgAcs/oKMH8qzQgMe7BgdLhQaqVip9MLKOKW
	sVAH8G6VrZYStyxNFCyX81mR1PdKNYhziP8Yk5AL5OyFZloZ5us/KDz2qf+nH8tZhPhlrwhddzH
	glmZwF1w9aeOPDvgWkq/qxBzMvyh8Pp9xFFedeyWhny6jQzcwdbHptNqtV32cDRWZGVsAeV8qJK
	48jnBmHezwg3YR9B8mG3fzUMMmwIF5KUgm8wH38JDTmdbtoWVIkT7RbAH3sLteIRqdlOWxWlpdo
	+De/bq/ccEILnxbKQF+urWFLt8sus03dGhIT7vbIPY4z/moderFESXLOFBTbts5ovSAr7KFC7x6
	EeGTD1O/ytlEtB1bA9k78xg==
X-Received: by 2002:a05:620a:2b89:b0:939:2c96:1551 with SMTP id af79cd13be357-93960cba6f8mr788246685a.1.1788426315206;
        Thu, 03 Sep 2026 02:05:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:939:2c96:1551 with SMTP id af79cd13be357-93960cba6f8mr788242185a.1.1788426314787;
        Thu, 03 Sep 2026 02:05:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4238ad7sm67640066b.54.2026.09.03.02.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:05:14 -0700 (PDT)
Message-ID: <b78f48e7-dfbd-4415-86e8-7d0c7c65ce51@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:05:11 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
 <kaad7btqyhq2puyjjnm2lp5e75hjizhpnaiyaol74icpkcfjlm@7yzadtvizm2e>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <kaad7btqyhq2puyjjnm2lp5e75hjizhpnaiyaol74icpkcfjlm@7yzadtvizm2e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a99384b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DOEPYjRYTCW89wv4dG0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sia1JYeH8ubsmpx76q5lCYRT1XbrtXpD
X-Proofpoint-ORIG-GUID: sia1JYeH8ubsmpx76q5lCYRT1XbrtXpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX1r1BQ0IIwybH
 mE1iJDBsUA9q7cdnwFsvdUJ/s4UwHlP6AEm9YegYMUDlcGwyCdbiV+eO/shhsLI/YovEmDGAwBx
 /+uzCEkbSAN5szbP+uFZqHPmBsiATflJ9YqWctH4DNJoEWE5VTWH6lE2x99e/vMX98fDQkJG5cr
 WWTq3aKfRcwRbgIT9Vj9AbACHGLUFtzaN6KwC53jAv/BDhmOlqbWrJVJaiVNagDhRAYp74LNqiF
 t/FVMgV04pw/TYkmp9iw4agfS9UWcukScOfobAAcEG3XkMGQEjEgnO8lFa0UgNFouuOiZX2LoZZ
 cGUc0Ikc7jEbguPWPv6kZUMUq+EUrfR57wcaMpEXzpm/tLpibrX6BP8Yg8rWoEhmAuRN7Ge4Yst
 epmZl1m9Pzw70zChJ7Oam0EuI1AtJfL7j0AZ4604nEp9cMy1AQJ0yNrbPN4v3QAliZsW5Rh6Fx2
 ApgypONJb3SrREYP6Yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX6naDujBm5vnN
 SJWirqsa57oxtMNzryLOVpQknsTYIh0w/wrfMITE9rosirBy3F5N5v8jGwd2c/9zMduMggx1rFr
 vVk9gNCgl4aRKveUeiBKeltw6T16iEc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030077

On 9/3/26 9:45 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 03, 2026 at 02:13:32AM +0530, Mukesh Ojha wrote:
>> The proxy power domain enable path discards the return value of
>> dev_pm_genpd_set_performance_state(), masking failures silently.
>> When the call fails the performance state is not applied, yet
>> firmware load proceeds without any indication of the problem.
>>
>> Capture the return value and emit a warning on failure. Firmware
>> load continues regardless a performance state failure is non-fatal
>> but the warning provides a visible signal for debugging.
>>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index a005546c265d..01dc0194e130 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>>  	int i;
>>  
>>  	for (i = 0; i < pd_count; i++) {
>> -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
>> +		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
>> +		if (ret)
>> +			dev_warn(pas->dev,
>> +				 "failed to set proxy PD %d state %u: %d\n",
>> +				 i, INT_MAX, ret);
> 
> Should it be turned into an error?

Yes

Konrad
