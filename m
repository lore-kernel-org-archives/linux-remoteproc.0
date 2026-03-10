Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7A7430BA3
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134259; cv=none; b=UsARHm+GKM9sDQXbmIz8EoEBb0NYKvCuypr/5qo4f2h81eLEaYgUgkFgN5YguL7W7TDRxtm42nSVA3OY+aoZUBItH3uXPW8LF4nfelX/Oz1zQRro64cfh5mx5GWSLQAv7cZZczl1sfh+Eg0EEzBTD9x1Fcm7DHOLG4hLf+jr8K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134259; c=relaxed/simple;
	bh=7h/4Yclabk6wNHjEMn8MKHlsK6axtckYcV6RVrETjhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJIjGnLBqcKjUFO4OAY2mcTqTNcCXD4Hmt9ICA/qxH4BiLuS31fW5aSwmVm5Z88cStXLYBnAVyBWIPNLQGl1QbqqpXX8R/wxX5Vmy4IPSEtL9do2va3UhHQyWKYXduSwCRfgANIIF/pIHf2+WoHegwLoMrC/OLSWJAM6z+WFV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glFOLc4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUx3FSwB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glFOLc4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUx3FSwB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8tNBn3755552
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MYKZxGiPOu8ZRtoTFNtUhc1HBg8grDgGM38nwNBDDM=; b=glFOLc4pUhhSufGG
	juOzFu75rc2eycZS0BawFPNeOheWjLjQqwPfSIlWmFiucB97rPJ9LQL9Cp/cSNKv
	plE3YXEUahfs8RsU8tJnFVxsW8HSSA8QCncdOeqmpLgykMNwg/ZpGVNTYFwJMFTB
	sOfgUyOQqUvP3VCWbe4/frXJRlqlmXI78YYiso9fsTdmoooLu18yqfRrIh+6ewMC
	y6JmSp5/Yg+ju6Rg4B3eIkfq1ZO0I1rf/N7UlPE/Burl2cqn4TmUeQZQqS24JPTv
	4Ezx3oM85QrMXrvNGpd4BpEp9S+DANv5eAH6evKzJTiOCYDiF+0tQlMc4iG2XIrV
	AEIAeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477jdpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 09:17:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso45024170a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773134255; x=1773739055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MYKZxGiPOu8ZRtoTFNtUhc1HBg8grDgGM38nwNBDDM=;
        b=UUx3FSwBQAK46aRBrscVCeekqG/a1mH2gFRpV68IvxXS44bNHOzgtHAvgd5/b+f8Vh
         eNwGPB3Re5zN08IvmAFglFi29OgwCGU2PU9xCCSBCIEKobNudI0Rnm/lFn+s+6B5284w
         pvvczG+KGg1N61bMcTKdyinuA6M9f43fvYFJTzpGPG62cri7XaswOMVYHAtzP4/AwL/f
         xjTUej5d8bgR5nqB9xoj6a7KmmIH5Pqy+3D7bEN6UNKykVIUiVaATk654P5DD3T96q4o
         UZvNsgoXmPkTPA9l4+ySRkLW6oNit+Ddh+vfqEdel8dNSnhuTmQROYiaY/B63x0feRak
         MU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134255; x=1773739055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MYKZxGiPOu8ZRtoTFNtUhc1HBg8grDgGM38nwNBDDM=;
        b=hPd9KpbBJjVK0mOaVMRLnpd4Qv5MC74YhxXgWXGxDMZGeq2p+cOUvBf9faQ51ukLDj
         AevR/2soatXNmDWSgcgkm3JS3evzvdFAsFQQMQdrqfE4SaxGTwOaewJZ9s4TV538ztpJ
         f13NC1x0kRgZKWOZmZWSKkiPRMzQ8XSttoMaiqXQ7ibhUjPyuX/rL6wZW9lB1ag/1rN5
         pGnwin4KoApwQB7Tmk074Uh5CaCUEH2RXn8mPHLOfxsWX9k21zutfBnQTrTmNr72IuLi
         S7Gg/DtHChEEqTL7khy9lMf9zjGMoizTaDqeucxZvpOQxIBIh+tDrSGjKih19Zqg9N17
         QVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk/lSkGXB2gUgD9ASNw+delQ6Q+AkBbyBdkMjVy43WqmLVoq4NJO4/xB9SABaiRIWwRei2u421tL4PNPaDlkmc@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMuc9wgjk/SeOOICPlRjctF1T/MWm/8ls8eEiFwADZimy5pxf
	B64n4ZFPmoFASD5sPUhqV21boIdTPeAwljRSyr+n0fOwAZMS8QbdNHzUwPm5px9uhh41r73iFCm
	jA7PI9+yLrD6B+VI4klH88FmVLR7qkuPGPP0KOGiaCIyQif5hH7kDkrxRMrfOW02Pmh+8rzbc
X-Gm-Gg: ATEYQzzCxbhHZX9f5kQV5ZLb4c8T1TkMBLHciUt8BtCbfr4cHURwxnePux/vhrhvNKR
	U+apBA4HGD9GEDyUhX0BebtiC9z8zhTAGVJvv2DIP5jpt7xytUh9QbKHuT4ZS0e8BE65+EtKVfl
	FVNqDGJY3uUn3E5RAlrXFIEqq52yIEVQ1PyYwi8eYN8J0dmGRjF/Ufp0P3mHBZ9uClP0Z7oY0nh
	nScGvZxTl/S2pvAJv25k41N1FwN06Vr6toxz+AN5s9dZQn6WCQ3v26eg/GTjBpH0XDONGHfTj8B
	7Xjm2lBDjP9Y3r3kjfb/1/MF03gy/hA/z+CKeK9NdA3kpmgb4wenX1zGiY8pTLrlU947rUHgT85
	L2VaViRTiP5+ThktxmyZgpiHtqzSikmnRzSd61JLcjBy1RwzSAcDx
X-Received: by 2002:a05:6a00:3d13:b0:81e:af19:34bc with SMTP id d2e1a72fcca58-829a2f79879mr13718887b3a.36.1773134255107;
        Tue, 10 Mar 2026 02:17:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d13:b0:81e:af19:34bc with SMTP id d2e1a72fcca58-829a2f79879mr13718859b3a.36.1773134254666;
        Tue, 10 Mar 2026 02:17:34 -0700 (PDT)
Received: from [192.168.0.103] ([49.207.195.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a467239asm13388147b3a.26.2026.03.10.02.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:17:34 -0700 (PDT)
Message-ID: <ff5a52ef-7a0d-422f-a62a-6ef812d6b676@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:47:28 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mani@kernel.org
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
 <20260310033617.3108675-2-sibi.sankar@oss.qualcomm.com>
 <20260310-translucent-almond-herring-f7acae@quoll>
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260310-translucent-almond-herring-f7acae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA3OCBTYWx0ZWRfXzLdMV7CQgDrn
 6uofhhxEL+NRGRSaD/eC4OU0+dAR260Lt5MMHOUhYim9sZU9y9vtZfLQaeyhDQj/YJ0EkJQ6z7O
 C9Rt1jAq1abXqnovz2TmmYvrQsWBpBwcjFVEJ4YskRCDEqh0p1q5TYdNb/UNpbXoRGSSkXSUC3A
 0OSt1MP01p1jwcLZbe/M/bu4sGvNs8Om7WXC4/ZuZavpgesJsX7u5JvOzvNbS4WO2vYjwpr4rC3
 tYtnjhww2io7sezZk2X8yd3K/x1ek9jeRl/LeEACfGJFSv4tEM93VSME/syATmpjAPYHh8lY9Xx
 sQmYTbsBoPclcRkXpMlucqxAsPxLj0W8EV2rH2exl8SmPVmDhYjVBB8+mrPNR2+L6M/3Hk++6gx
 rPDC2bVNGGpCy7yoUmu3dZGMAAikt3DCBHPEYNkF6CnkBUnPtTKs2g+/IgQ1VNu9MY/FGcbGmgo
 smS92/sBw0aMzOEeVmg==
X-Proofpoint-GUID: ZVnsTdL7ZUPAFe58wsGtCeufIdJneZf_
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afe1b0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=FDuvZuZHjihTmU/CkdNO9w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XJ9aKg8kxmvS5VUx9gAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ZVnsTdL7ZUPAFe58wsGtCeufIdJneZf_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100078


On 3/10/2026 1:20 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 09:06:13AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur ADSP PAS which is fully
>> compatible with Qualcomm Kaanapali ADSP PAS.
> Kaanapali here...
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index b117c82b057b..fb6e0b4f54e8 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -29,6 +29,7 @@ properties:
>>             - qcom,x1e80100-cdsp-pas
>>         - items:
>>             - enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,kaanapali-adsp-pas
>>                 - qcom,sm8750-adsp-pas
>>             - const: qcom,sm8550-adsp-pas
> but not here, so fully compatible with Kaanapali or SM8550?


It is the same as on Kaanapali which is fully compatible with SM8550,
so applied transitivity to the commit message. Anyway will get the
commit message updated to reflect ^^.

>
> Best regards,
> Krzysztof
>
