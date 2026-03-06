Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64334F261
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 22:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772835378; cv=none; b=T2Qal1DTxOm6IzKB9/0NcqvwBpqsTWExFVD3NtjxNHPkkJ6dudZqKcKopA2yeXQ6bi475qCwMKwOHfw4KEAE5A70C04F3/eoYaJ+CAQFPsvUjs97FxVEUv+e7CSeOzgWlmcWs5PMgLvvuY3DwUJ8BuXUMTuUkEZUWpPJAx0Y9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772835378; c=relaxed/simple;
	bh=ozp5w2u9J7nebog4KwPAIQaw9Q3GF+gWT8k1KRnFxn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ivw4iHr3/x/Xo3r1B5tWiSIy0CXblswrUjEieuBRwvD3tJfi2KQbU3hXVXRX9Od6RFe2HAotU6EHB0wHhwsOE7Z9Hb4YHqM8MLoee/g8a+sJywmUOIu4wpIHwWAMHiSa5XcF4RHH0YAsE4ymw9CpfBUBN/8tKCZJziR7+l8QnlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfSjst4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jF49rd7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfSjst4G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jF49rd7q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWqdV2357795
	for <linux-remoteproc@vger.kernel.org>; Fri, 6 Mar 2026 22:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=; b=SfSjst4GB8hij3Ya
	xumyToC4COQ43yIm2aQSarzCnpo0ypGv1UWid+nyf1aAiMF0Mu+lt8Jlnh6wZEzC
	z4nAMHqTQKPfGzFi4Ldw17z950DNAf03OiMcQDe7wwE/yO+WD8U5uSjNlAz+xe+E
	DI126rXVobs/QALLHK6ZUrp94YQkgg6+6YV5FIgosf83knfO3y+5DeVGfbKpw505
	0N1VQxl+B1ZgE5cgBtv5aVouUiY6VafcBs3QVFZGcpXdHBxf4sdQkDacB7oeO5Xn
	213NzZUpLBiKTugTF1ByolEGCHvJCbJb5CxMg1cmT9VYtIEhF2oy8+NVVw03lLlg
	Bzz1rw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14j2ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 22:16:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so958436eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Mar 2026 14:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772835376; x=1773440176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=;
        b=jF49rd7q2ZFEmPlzUtEXVMtsVd71tthuDah3VBfRdNj5dkOEUXgcBzUmEIHUgZViHV
         uSx2oDYIHD0C4uwTWJ2eu1Urmkw6GWt9dxclmVFoPMvzEIW0vjz1CQx2x7gbtv+bxz8T
         ajCgPBNmypPdmEaxp9eaWxrugLJc0qkixnsbSSl12wov94kNZP30uSmINFyhi5zJ1Aj0
         MzPLwiPk8uBD9/e7lrM7s61QBufpsrXxoQ6HX8qsoVe9isBuFGhcZGbMmqabduaS1C2Q
         nZkpIg5wIlmrgQt19HujdEHnAhXGKae0XGtd4VadDY+Yv6X8ykmN0rUkSwDFnNfeov1n
         HyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772835376; x=1773440176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=;
        b=sxQZLf9J8YktDAsKQJA9mUzy9xELs4m0udXyzicorCbz2n8Yvq86oFbC6aBXiaQinC
         Y23NhVHnlT0LmTPZ2xxLvpIuOUEKQUj+YKMKQOPfQbHe8EbdfDyKfje7kjnGK16H8mLS
         F7JG5TzBPgTJimpJylsbiPxo0piREJ7KoD9jlZgws6kg2q7K1y3bzFR0tE+Q6D5XaOs0
         /j60+vw8xh6XnwH6IeZDgbVBMzJYecnbfIaCzke3UuF2SbwXVZH1AjgI7nwWDi79KDDc
         6rf22GtiAIu2uBxR1++oxeXsID32QD8DImOVh0IHUYzQY5jeZcFcuRnGfMbXJjfjiXlD
         xufA==
X-Forwarded-Encrypted: i=1; AJvYcCX0j6NtHQ55PmYqO9l32z/ebvuiGzEZ9B3ncxTQSMb26UpNPyHujEu/nnyVRJcbcqWUrc05NqvQrn8Pe/04p0YZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnlUjuzY3fD+lXCwP2ujQVKExtdhnGtKegguF8m1w84yo0FJa
	z8f2w15Uxkaet3kU3NCTtUWZuu5Ghr1wFj07ea5kVZNooTcJ5QVnT99qXg6Tz0bJL0FmoT9fALb
	3AESPQpmj8mIMN974pVeiOmn0KUeust/6kIIIH3kvcFPuwbyRxmX3ZbSie+t78YqYaoXYQb/C
X-Gm-Gg: ATEYQzwJgSTDAQweUQEJI4wlax81eGRMYlXrftj+kjFTKRftDSsshNOSfN7KOY8IY5v
	bwqeaYqn+JMdL9CjgTFJPMvRXro2trmpU5wfcIspsOOQAOJyCyB4r7Abm03gLVWuWz64oRJo3v4
	BiWEDvst0H8mWdekkFfg+D2bbUgJt5dNleXBZ19mVuMSMttE5IkIDpf4szNTA7UUujNYIV/5T6l
	f3AXcZ8CqqMr1WLapHl+/VQpoPMK/ezf1LN7vdVQ/wZbdkiTEf7jm44/jHiWSDE9hYWFJmEOCa6
	Fwx0UwM8cdr9RBBenpqpJmXcIVYiNv6JYPlJkk62GKjE4Ye6Rl5tDJBqyK0WcNbTseDP2HgS8LU
	MxJ9E0zyycHcEUKpxpSgjcoD0jFHHEpyEVgja+RAt4ltK6jKbkn4H4juQ0o36JdkAbAxVqRjfXl
	X+moxO
X-Received: by 2002:a05:7300:641d:b0:2be:1b95:2400 with SMTP id 5a478bee46e88-2be4e0655c8mr1446300eec.23.1772835375704;
        Fri, 06 Mar 2026 14:16:15 -0800 (PST)
X-Received: by 2002:a05:7300:641d:b0:2be:1b95:2400 with SMTP id 5a478bee46e88-2be4e0655c8mr1446255eec.23.1772835375083;
        Fri, 06 Mar 2026 14:16:15 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f94823esm2301765eec.20.2026.03.06.14.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 14:16:14 -0800 (PST)
Message-ID: <f825ae05-6285-4d10-9d66-578fb1221495@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:16:13 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
 <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIwOSBTYWx0ZWRfX8adXKHu8Tb3n
 B2MHlGrm9TisgxkcGkPyegcHZe2SB/NotPHjMl1GyMPj5Az/YrM2ZW2LnHUMQYQbBI5JA2Ol5hy
 JpqsDf9/mPXj0RrqAL4xC33YwpCJ7M8/ih628vAPDCllAWrTY6giq6MCn/+3m/0rB8Xvr3xPMKy
 HC1U/6HgPns7d4t1FrXy/jPXEjOKvb4RdQDojJn/2cwmTKwkjz+wFsPtdVtTjawAk/Rp8+OOupn
 6MZor37qSYHg+dRZ+cajBiEprsKPITyDbJqxG1l0tNyZY79ezrkzPcnHmVZItwG3W0N75e2i1AV
 A92GUdmi94uFgw9y3hZX473E7RY24Iidz+es8LFl8f7TtiVIbvGmF0JVGu9DK99n9ElSoh8BE6K
 p85BPuGi81Vt5YbOatEAHQvYzs6408WVAppZd2TA7K/dUwNcelQhddzMuUMKURrKfT6rJvZW9tF
 o0J9cugHnTT9bMbd8mA==
X-Proofpoint-GUID: TT_CMEq3Gw_qA9YTRej78ay0MiVzHog7
X-Proofpoint-ORIG-GUID: TT_CMEq3Gw_qA9YTRej78ay0MiVzHog7
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69ab5230 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Js8INul6CuAu6eKS1T4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060209

On 3/6/2026 2:00 PM, Jeff Johnson wrote:
> On 3/6/2026 11:47 AM, Trilok Soni wrote:
>> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
>>
>> What is the convention for Qualcomm authored drivers? In some drivers
>> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
>> clarify it here. I prefer consistency here for the Qualcomm submissions. 
> 
> WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
> driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.
> 
> And in reality it is very rare for a given module, over time, to only have a
> single author. The git history contains the real authorship. So just for that
> reason I'd drop it.

I agree and that is the same guideline I follow for the drivers we write
downstream. I just want to make sure that we discuss it here. We may not be able
to find one single solution, but I prefer to get consistency for Qualcomm
submissions. 

---Trilok Soni
