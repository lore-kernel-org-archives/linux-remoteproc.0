Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66B3DCD9B
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176338; cv=none; b=QTpmO6LCm3/T2hBasyG779eFFSfJimfFofsmKvvguIchFWPO5kR3pf2cbjWrmGNR++KBRGnZpWSVh853d7NSdSowF17K8HLyjFGObDbsBfn5O+GsuT+gPZ2MA0icsIGuPpncVr3IDNo2v2YeiQVbppi9uutdZUzJOHTx+U8BlyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176338; c=relaxed/simple;
	bh=k8RSWna5l+sutgVFwIL4tV7HYt0GmcYYL3d9N0V3OUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIseM8yLi4sLlxWS3U+kRT60yPA6+YywGf+TsZNnjPpfD0Q3acWWsPyHAbyMaWMxB+xaKJm7umBGP7SuCEvodFYnccGO/IhPHhJGiH/EF/MVrOODctvQp1N7AGeoWPbYXSicPk2Qo3puJS7XCeulCjUjgvjnFVlyFFhbZ/o9uEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAjhRnoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0vhFYY6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAjhRnoF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0vhFYY6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xRUH174141
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=; b=NAjhRnoF68q3xKdd
	wThiFcCO2aGOsmuncKDZT1RXAzDDc8uGWF0fiUieDqzTbBm/gvSSgiUYzgNgbxoi
	FOfmfXlM2tV+6FVqckWlHfgvx3uMqDzRnzD+f/bwkpPoj9wmal/zMDik2AZmfV7c
	SfpPfX34PvL3ReO64ZrmTASYwC6YkTr+JWA4OpSeYEaK5EjkGZ28tNpJkq6WQ1bc
	XNaS2UHo8hItqWrqmSTcqBVbwDC130Ox6Zmo5E0VFfRp+Z5AfPDK7ZTZPFy9sbQb
	9C4vUAlkoR/csJTdxo9a++LmvDoj/gbKrgj0fHqMNk8yeMNZaPQZFAMZZGsBqzTz
	E/Ox5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb1nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 11:12:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso5779432a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176336; x=1781781136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=;
        b=D0vhFYY67IsLKT/blh3AY4oOlBm2Z9KX89DqS1fmZMVnvetpLXYSfQShQQa63n8nCG
         3jxxxOnyvamGqz98ssORWYGJGaIiiP90q0spKuJ9qLI0dEHZjhMWhdbzCwDayxIBf7KF
         ABOUtrB8O88gi9QkEjAk8TAeYAyoZF0Xm3dcgbRYwaES/vqz1pQH5oUJkL2x2TpRlB80
         4oOcuJXwxjNqF+nfH8DstO+Q0CNddND6K2XGjlW0gCRW9SxmGhVYLAMqb8gN7bNxl+0e
         5IAXzHIPHYYbp0cMHkw7vWfUcUJUXWp1+Nbx+z/ADfM8SaBvscAhsSCOIfoXV5dgCm97
         Padw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176336; x=1781781136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=;
        b=BuEwK6PUIermby6NynRXPpubOfiTzapBBHFdM85dBicVMFLiUV66yMBGl1b0noH3se
         Gd7Cb+xkEmq8//P31k6ug4Nuuc3KSqVR11QcE9Z1ACZHL3TmRyl20TExPxp002851sRH
         Hci1nptPpbh65QRYe+qNzH966Oo+XvvMsjegorI60EAwMbytGFo00XL2yEGuexe8XF4m
         j+mB51BQunwHJNQ8grdoRwoYfVc11SBybG1Ebzw/1Akyn5Nfz0zx2HRsgdRK4RB+HsPG
         KbrHoTtSavnyjpLRM5yoR57CxnJmw2qh20Pm54eLBdD1kvMeKokmPzoTlXmUVbBIG74G
         xv4g==
X-Forwarded-Encrypted: i=1; AFNElJ9PaaALdNl88zpSB9Y52R76bUBZEU/oTo6mCwBv5ifvB7on6N4ndINGRCXkBHw9sqokmwLpji4lA4AKOrbtrGs+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7M6K5VVKPah+m3Y/ZEGyvm2+sKM7kHUWQ2M/U1AJnVvDFRCpd
	bxUvttABoszAtnEUpm2qGmJMc50mf2JPIkmJuZUNv9MNCF3ssa4w7bMtGaysMc2Ld6P6gXUPGdl
	bfndq9K2ojI6qfGOTiKmMZFFIlaEdR+vbbv7kqBhvnOeuofmyucPneHbh4awZMSv0vVOtcZAF
X-Gm-Gg: Acq92OFCmtWEaaxGq4dbJT/1dY3fWxzvs3anOsnB8T7X25bwZRnsGG6fka3MS6u7siz
	OeDm530BIe7em/ZB8ag4GHFbvxTMPv+eKLhlIU+35i2LPSVwDjyKnUj+y1hZyhCKtUIsGPJ/jh9
	Aa9xiS6gjDIwNKnnzPzSozxzfK/VT/JBrd4xZCxjpeP3yjK5osej0O2K1gogHnA7B5FETYiGJ/+
	8cYNqjiHwGEwCxdSQYWCu8BcABhrcKOy8pRnxI2yz/XEOvIAITGbQgSAEqkPbmqizbAkyBbZI34
	o+zbv/YacOXpeUGCRzX6c1OSUiSr0qjPm3JtwbQjTZghP0tPOUDzGu4hqh4iUbPTET0jI7rCXPy
	khRlQLSSo3wZEaO7woOLmIHmXRAXxVEwQ6TNkIpqkvwNYgJ4luKTFrEJJ1MlHS74=
X-Received: by 2002:a17:90b:2d0c:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-377a937f654mr2732721a91.24.1781176336165;
        Thu, 11 Jun 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0c:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-377a937f654mr2732683a91.24.1781176335715;
        Thu, 11 Jun 2026 04:12:15 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377540f7ec2sm2193426a91.15.2026.06.11.04.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:12:15 -0700 (PDT)
Message-ID: <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:42:08 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mfuMtkrarabkdXUPJaW1n9tKxgVtJxUP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX5LHu0r5wCocR
 GuXhPm/C8A61KWhkLXx2CET77ugV7lTdb+w465A+Ni8aaT6XFYo7V4iI+xaTH0b+E1DNIP8Hux1
 s4tWB3TGdWI5WPmCi4FpHHy851SA7aM=
X-Proofpoint-GUID: mfuMtkrarabkdXUPJaW1n9tKxgVtJxUP
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a9810 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JVF5FwQYlvdi58aEJx0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX24IZyVWF/30S
 eAsH4U5XSqUv5xZMP2UM7QobD6cIXrYUlrTaPnyhVY3oUHomrnxb/ci2coH/gHjKoDSdnTiF2bq
 MDIIXXRrZKqjWYgvfBSXsP57HntbODP+8Fd62ZSOVdkuF3N+5I4udECj5hZrQN342MqPZVcdh8f
 mL3mAgyLTBJuR0Pij30ip8o4vJsertJupdz9noQKrajutBGdKwodm7bozowMmd1bbZiKg6d//2p
 n76Xhpw9k0UqSRhekVDbETjTDhzvkqzHmjRHuU6KlTUXgTXMZpSWIqm9wF5+bsX1IANMWzOE0/i
 rakXQRyIKvsaK5aT6pPEluAuDW1RkifbJk+ioEFXk0V0fJ+I79x/eF3LiSKY+TBs/ZfegSuCko7
 jE77hp8q2N/TVop2nTgAeqFKSUS7RjC3UAUUTyS5XC7HRMVNrM5CZCTMQLjxY8UPBnF1ILtHtW/
 fOBwefqjXPioTHY5eHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110112



On 6/10/2026 1:01 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 03:52:56PM +0530, Gaurav Kohli wrote:
>> Document Qualcomm PAS remoteproc thermal mitigation properties used for
>> QMI-based throttling.
>>
>> Add:
>> - #cooling-cells (2 or 3)
> 
> Why 2 or 3?
> 

thanks Krzysztof for review, will use cooling-cells 3 only as it is 
backword compatible and will add why part.
  >> - tmd-names (thermal mitigation device names)
> 
> Why? And where is this generic property defined? You cannot just
> sprinkle generic properties in random bindings.
> 

Ack, will add why part.
These names are matched with the thermal mitigation device identifiers
populated by remote firmware over QMI and define mitigation devices are 
exposed as cooling devices.

Without tmd-names in DT, it is unclear which index corresponds to which
binding. With #cooling-cells, tmd-names in DT provides an explicit
name-to-index mapping. Please suggest.
> Best regards,
> Krzysztof
> 

