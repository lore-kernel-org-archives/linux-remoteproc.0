Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854DD37DE9B
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Apr 2026 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600075; cv=none; b=k1X8DUO+d8ofRc9JOgYBh0HMfW2gjVAVVys/reQ6UR7paAkQnTdyx4Fr6x7SCQmNsBt8rJFM/0ded7hjcIn7dT+nRyLTbgD0QAMx4pGNllV7q3Jm1GJBTfpWoD+7DeBq8+7dRXm+dqSKSyMpo6NorY0PcpA3+j38djL24/A/bzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600075; c=relaxed/simple;
	bh=O70zG8/vQ7/2/njiFcnoP01VaZrKBSDy6k7ous7SiZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/GOZsoNExt4f5rwsaTY4sx0R4Tst+TN/XRpXUtyGs59zmI7aDDBt2jGWk1Iar843sWcqRosCIwkvlPTJ2G0uhGGQN+lAUf/mFxsrka74TC8qZy/mJzpXj+Ibu6qRUJSKgyt3rDhGFAB5vuHjVmh0BlsMnmj0+3A5uLO0aGhYhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OweH0Y2k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Towwi8qC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OweH0Y2k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Towwi8qC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637M4Ps22860736
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Apr 2026 22:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjGZu1nMIYxEH+BkM12qs+iRxdD0JnnyuDFHzOWT/rM=; b=OweH0Y2kARoYn1W1
	qq3nLdCQrnMusgkFKVH97SH/YIOnMEsAfAZK2KoiG9Gxh/8/n7cU1UsGD3/JY+O+
	TnCC6+QeX8Z0IUKHaUmjTIypZ2H0UfYbyJVOT7JUEat6dMR7LzZBxjoLQJyQmwOz
	hXC6WmTAPgKiCEnt8sayLvxEaf1aQEZ3KVbNm3zDkVgkpsYAgEMpiGSFzicXC+GT
	zLbUcVWQXj925Bce1NoFoyGvgQBlVpoEnadvPpUlxJC/tmR4UarU4h86gc0j8iqn
	9zGvFPUfebfRPl8K/kWd8XSw9wadeBrURZDqQNVSPOk9jaO1/Rspujy1bXSio4MO
	UaKy3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8r0rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Apr 2026 22:14:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so7871850eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Apr 2026 15:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775600066; x=1776204866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjGZu1nMIYxEH+BkM12qs+iRxdD0JnnyuDFHzOWT/rM=;
        b=Towwi8qCgZfYUflNkOb/McOoIKWL4FXtnHS+61NfoX++L3aMY7rz/hE198FCH4bEr7
         lTERDD6vyUau5niV1ACETaGLJLCGKM8CtQ0iiSxhmTxj+2HO2sINAgOq0BoMpBk9P1YU
         W9md2wZDgOfa20KbSwBg+UV8n0wd523R2GHFLceuS34njkbSagCzY+oSqRTutlOBHC6Z
         e6Q135NmJUVeVXysLPa9h+mTLE1K4lGnxU8vGE6WgQf84h93PCfXW7qpQB3FDz88YPWz
         6xhTGOk4ctF9wQjZs54SKwXMl75pDrM3hj5xPU33fZycNyzpm+gsA1bz8/8rTSIX/0Ll
         hLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775600066; x=1776204866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjGZu1nMIYxEH+BkM12qs+iRxdD0JnnyuDFHzOWT/rM=;
        b=V2NcljBGN3dcBz9AgbdEebnPvUxXInBE3tCgI9Q71LGGjVFnqa1GeqsrKuyt+cTcIq
         wwIcS31JfWe2tkF6gRnDTw4khzR86D8+4HzALWwu6VkpmQL7f2jo7sJTPrhfOvqID9PA
         xe2YcpoqfEuTS36UmKYXcVlvK/1szfzReVXWbzuYJIubT8yuToShXpPObaiQhH4/PT9w
         e+GM4Le1eISXcIhC/UzCvYboRSySmMbgfXhHtG5C+xU6K6L1LL4Qe3q0FVLINYMdsb0p
         wFVmsXM1TyyLPc7ftXLxWJm6A9jqRBehPyHhB34hLMtqNKKDDvfxAKH1uA1uWLhhW4aZ
         jCjA==
X-Forwarded-Encrypted: i=1; AJvYcCVtDqyFUhTdNGf8TokUo8V8GOiZ/U5IWUOKDhIqrFSmJ7CK+nX2bfIPUsI86NJHxRgB3/jXGdt8FXfWq7amHhu6@vger.kernel.org
X-Gm-Message-State: AOJu0YwBNtJQpGRtfNTohZ88Cz3L/USAPZ1vMXVLDWyIKTM9db+EEu9k
	P4eooNt1d7AupNoF5IKPXEcX7lTFXsYJ/zKRLE7z8H8jS566dVvKyA8RBWrS+IX5A6aP6tBiF7y
	ad6A896d90Enbz57k8nWZIPuNOGGnDdM7eqnaOPztRjT+d0pqulGIim4ElHg15lOMXaX+MCEH
X-Gm-Gg: AeBDievHnxgvro/NQoosFOwxFDPHTMMZ+1fPupnM7BmKMFJgi4axePTN0zL/v2rwTe6
	awLij7vZSb9LOMsHrZ37HRmQ2JO03Xt/UErZ2NtfCPV8pY56qkcca568eMjPvfHcZ9rNjsOeU1f
	gE0WBFw7i3oW5n1BKwAXa1Rg2w+D9B91ux48lXarOISGAx7oj7xBQ2olLWfO1BgRLUIPGfYZc0l
	YQLivlkEw6MAjR5/zAUxCgL9VB41QVeBqdHr9Qlj8TQ7mNEJPbD9ZwD6hZkGoM8pL17Few/199B
	EqP1DrgswnxoAfk34L75UkdUMl7EylNsg2mW4G3kdnGMs6Zh17Np7VYmcHVqm5Ykdjax8CsdZA3
	pBY1XEfndgi49cJzFxNmz3Mw4Nqd5qEpj9wj7RepRlqqyzYnx50sAmVJdVrpka0pzL/ALGlhwa7
	aijEoH
X-Received: by 2002:a05:7300:880a:b0:2ce:f3d7:20c with SMTP id 5a478bee46e88-2cef3d70bd3mr4324852eec.29.1775600065598;
        Tue, 07 Apr 2026 15:14:25 -0700 (PDT)
X-Received: by 2002:a05:7300:880a:b0:2ce:f3d7:20c with SMTP id 5a478bee46e88-2cef3d70bd3mr4324829eec.29.1775600065017;
        Tue, 07 Apr 2026 15:14:25 -0700 (PDT)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cf2be19f85sm12178552eec.30.2026.04.07.15.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 15:14:24 -0700 (PDT)
Message-ID: <439f9bbf-1ba1-465f-b5af-01ba0ebb86d4@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:14:22 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] media: qcom: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-12-sumit.garg@kernel.org> <ac-KQ7e8-syph1Zl@trex>
 <adOcMsk8a_Clb4WZ@sumit-xelite>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <adOcMsk8a_Clb4WZ@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kcdRFvIeEeioQXClB6oxvETFp6T5wPAq
X-Proofpoint-GUID: kcdRFvIeEeioQXClB6oxvETFp6T5wPAq
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d581c9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=nRfXl0x10UYwF-qtBXkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDIwMyBTYWx0ZWRfX34fOfu9ldOHL
 wgJ1YPkoy/8EEsfLV5/HfOrainSlm6p9x0B7u/A8Yv0TlIoOyDXBuXSyo1ugj0CmVPkaCaADgVI
 J5YuUEwWvXdKtxxi4p0KpHvZqkqJ/JZYr9JHtPXdusgQ7m/6OQnsIExFqbIkRw00Ie10bJ9skal
 1l1oHwWv8yYcfut/L3+GWN/dlSNoRpARYmqBVJFjwGf5d7CSAHp4Q8xORrhqmuEkAMbnWG37/tf
 +Euq0W9sReApaElNdWJfqWILppr+fyGN4+j2wdllX0asPFxb9WrCgjJ2AQJQf29ZIvIimX1lqAD
 ScE28ijOmRIFKlodUQlaGKt4oqe+vIK09wJqIhWAvxBWE/Wq49snFou04I6Nt2I3BFaCtmDVOBE
 tuj0Nmz1ViCyCNgxsiiCo0hVionhUN8PHfunW9FgFddLjKJi5XdsmcJkF1liB3BOV9O8NMYNUWh
 GkjAPUnchOFpk/SlZTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070203

On 4/6/2026 4:42 AM, Sumit Garg wrote:
> Hi Jorge,
> 
> On Fri, Apr 03, 2026 at 11:37:07AM +0200, Jorge Ramirez wrote:
>> On 27/03/26 18:40:39, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
>>> TZ service allows to support multiple TZ implementation backends like QTEE
>>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
>>> backend service.
>>
>> OP-TEE based PAS service relies on the linux driver to configure the
>> iommu (just as it is done on the no_tz case). This generic patch does
>> not cover that requirement.
> 
> That's exactly the reason why the kodiak EL2 dtso disables venus by
> default in patch #1 due to missing IOMMU configuration.
> 
>>
>> Because of that, it is probably better if the commit message doesnt
>> mention OP-TEE and instead maybe indicate that PAS wll support TEEs that
>> implement the same restrictions that QTEE (ie, iommu configuration).
> 
> The scope for this patch is to just adopt the generic PAS layer without
> affecting the client functionality.
> 
>>
>> I can send an RFC for OP-TEE support based on the integration work being
>> carried out here [1]
> 
> @Vikash may know better details about support for IOMMU configuration
> for venus since it's a generic functionality missing when Linux runs in
> EL2 whether it's with QTEE or OP-TEE.
> 
> However, feel free to propose your work to initiate discussions again.

Vikas and team depends on some of the IOMMU patches to get accepted 
before they enable the EL2 venus support. Please reach out to him
and Prakash Gupta at Qualcomm. 

> 
>>
>> [1] https://github.com/OP-TEE/optee_os/pull/7721#discussion_r3016923507
> 
> -Sumit

