Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA4834D4E9
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837756; cv=none; b=k8yE5SWqyPQXvdZqKmf+x1Z/ySgceSfvwMr4WuuUSPR9Dkzu8DEurDeQ1W/IlqzZiayQg9TD1lTb9fWqs72D6iDuQ7H6GHf0w0rE9sMh/5JuaicqAgn7OmBjDHb1yR+8Ue1yC/3BvVJ2hpoH7rmaNEWne/eUdqfjGegYfjNVzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837756; c=relaxed/simple;
	bh=KlM4Wei2v8Ak9Fx3stfKNDE+6tYQJ7Pja4dRQpoaA+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fsu4pCshF41A5rZyTv1PE0IABalNlEB/zhoMHHuZI/SOcPIEqf9VseyhfyqUoXHwMQUeNUiCqIcVXhSeES4qvQZVaQN1SLsA7vBk6ABwp1kYgNACQqVP0NPz+bPPBxMWVckgy1wEfIcQjR5yxjA7jAe4EvXORBEU0ZdCDFx3L24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgPei3rs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVx78ExR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgPei3rs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVx78ExR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNHlE72045688
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 09:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eN7Ug5P4IulUD8R6oc/tr1H69BNlQK6QUos9s3IP/G0=; b=PgPei3rsOIhtAWo5
	5Z029DFPbn4BtObtDnE8yAdRIE5N0DRD1e14GABAvMIBoj0Rl5YSMmMgYcLSprb0
	VXe7mfdSSEa16caVx+2raxup1eQrvMlNNi6bFjk5WVkC47Xdl9UcrTkUJw8IP/gU
	+l1gxNrKf6uY7X6VJqwEy6YSou9jMbYpeX2IMjCxV/7BiF+/7Ey26dCudFnak2ed
	QMfDVHs3CkDbLWqteEuTveie6wbUKI5e/GlMmxakyIYiOh/fCgUhHyd1yBldKbMg
	lUae9KQOoKkAKH7X3XDsZfPbaT9Cuv8uYEWEtfE0MX4FU60AbAY9Ls/9iJ2+eP1x
	CQrSyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav3sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 09:09:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7d7b87977so44484295ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 01:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837753; x=1772442553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eN7Ug5P4IulUD8R6oc/tr1H69BNlQK6QUos9s3IP/G0=;
        b=jVx78ExRfeKslpMrIYPiJlGebqc6apfkRT+5VXoS8uJqzJteMJEf6tvmYQDRHg0W1x
         pHQiqeRU4o/GbXH9AQ3ZvtTMGFGJnXZ+XlNASNMw7Op1VheDyUc9YTyK0l2rFoK+ji/x
         yMla88MWB1+JwnrIkeFEzWXCXEfr4pIp7v4iKazRgCfiEgVG9SoXLHA2xkl81QenPwMw
         g2reb3rfATy0qQJ2IVI0J0UuJGHq20wokL9LYEyzBf3ZTRQYvwb3Hze6687PUgeV9mcG
         WLnCOiWtPANZwW+DqxpDmPKe4T8rQIb+xwdWd73KFXPpLyIBKalx3HAzzZ4cT+9UWx7D
         s1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837753; x=1772442553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eN7Ug5P4IulUD8R6oc/tr1H69BNlQK6QUos9s3IP/G0=;
        b=qTJF8oZuFw8qtag1al7tdw2Ri/NltFqhxidTSZK3mcLg834ccmBTOtTDaVIndbFcyf
         eDBMHSKdf2VK4OEFzeu/9Z04YoN758D1QT4hOn+xM6++PPEH+tBfTbJwh1EChUnXY1bZ
         ypNBl9lejsT6FBDVjICtSjEOqAr6aYucaLUpCOKlDB49iP5+vSmbZ0VeXRUi5NmA02Kv
         5aV1aCphXQHtz+U/r1Hc2VjxJvobKrkTeS+zXY1X15TyaVNf/SjtpZIvMsccapoSGuwn
         NvLH8tFFoHsqn8h6d8tLpmnT1FTdNjstyY6k5EnhIZP2dzhel/jwQ/EeG6GFa4SnOvxQ
         7P7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqsuco03yPCmx0MgI8fzwI7gEm8meAIHK/YzNyqROesaS+mdU61WbHQeiiTC6GGJV72AZxGf4ITPlcom/YqSql@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Av/qUQE0kFVW0pPs0vCIDFbIQce0FIGdcAxz+k0Ly+zxgHWU
	+EqZ1Zdjti4HMTPN5M4tXAd6nwX2CNTdF34Bx5mBieYBI94KbCz+1Dtqotnx5Rd9klI7UbRL9g3
	hqXf8VYYFXfUsWIA1ZGKvGI6cNEvA8wI05WR88lfLY3x/WHp7QHgWLocq7hw0CwL39nE+Snk+
X-Gm-Gg: ATEYQzy9fhWJr3zDco1Irofz3leBUj7CdvZO+kKcem1kwnd+BAR/pElxFCgPF1bf6zJ
	2ucE7Bexdhh3J+PkzGWUh7AhYRaRkJKLsUfatMljcyPG3cy+bWBGpmgm2N4T8Fit4Y2C26gqFQe
	d4bjNytDO2/W92jY+7sIr2RLU2stvV6woys+gMyK8lj9JqSfPZC+Gn4bq4znX0yfvr2id8X9PJK
	RYBd9qljAqm4zFAz+90cOVWrku6l02kLvTaMjYHBE1niU4YjPQm722PrwOUxRxnaXfQTceP4oe9
	6XHq9drkLw2yZGosQrPVUHyoTWfwemag4yVSVa+3P+AoeIbGV91JRodCpOWDAN7x1pO0yBy6us3
	8TBQi7jIzkGn+gP/08b9FWfIZF2lj1aPFWIgnOl3PBjIFMn96j+YlvIz8M7rcLGIXMink191Q2p
	YD7uokdkiZ9VLDXyfAxOo/Fwth4HoFxM2cXQmn+4Q=
X-Received: by 2002:a17:903:1b26:b0:2aa:d333:ce84 with SMTP id d9443c01a7336-2ad743e37b3mr80704355ad.11.1771837753415;
        Mon, 23 Feb 2026 01:09:13 -0800 (PST)
X-Received: by 2002:a17:903:1b26:b0:2aa:d333:ce84 with SMTP id d9443c01a7336-2ad743e37b3mr80704045ad.11.1771837752910;
        Mon, 23 Feb 2026 01:09:12 -0800 (PST)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad80907b4csm34202505ad.78.2026.02.23.01.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 01:09:12 -0800 (PST)
Message-ID: <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:39:06 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c193a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GmUvsNMoEockHelqzZ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXwpLNyOFb8xz1
 VM7y/eFX/w2mMoMo9AP8Uqj9A48FbVtyhjJMsOgqRzwAnveaZF6x+KWHis0cQg7GxOtqaGtzBRg
 cBtgdgOY21OmY2JGgWtqD5+SNKR1WvsuABEClLIJ2MLFwB50xj8jem6KGS67WVlXr86SNFrx/r3
 4x00C2B7a89VEV2RE0qnwjjUI8/vvKh5rAskd2JQCPKHJ/hHERc0cOcFJ5es9hr4KuIX/X8j654
 KQvnvij50CoaMJgyojLLHK/aZ/qGjA4TGbO2QgejoJvKOjSKTcf2uioJMA0rQVbt2DPPSLLxGbG
 kLrE14NQlQbuWRfUnCiM6PF+ux8ve2QQW+yOYDyioinp6RGnzljgDwHldxdG80TrVHnNgmto6da
 obD5MpszEHJpcahZ9G6EOazaLiAmgEsY1SzsR44q7MkzpUcDFEYU7f7Zak4/LDzfworL9PqiOCF
 nAgC790eHx+hx8ZralQ==
X-Proofpoint-ORIG-GUID: bIAQHQ15heZEtbbZNsSox39YXNA6cm7M
X-Proofpoint-GUID: bIAQHQ15heZEtbbZNsSox39YXNA6cm7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081


On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
>> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
>>>> On 1/29/26 1:13 AM, Sibi Sankar wrote:
>>>>> Enable ADSP and CDSP on Glymur CRD board.
>>>>>
>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
>>>>>   1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> index 0899214465ac..0eed4faa8b07 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> @@ -487,6 +487,20 @@ &pon_resin {
>>>>>   	status = "okay";
>>>>>   };
>>>>>   
>>>>> +&remoteproc_adsp {
>>>>> +	firmware-name = "qcom/glymur/adsp.mbn",
>>>>> +			"qcom/glymur/adsp_dtb.mbn";
>>>>> +
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&remoteproc_cdsp {
>>>>> +	firmware-name = "qcom/glymur/cdsp.mbn",
>>>>> +			"qcom/glymur/cdsp_dtb.mbn";
>>>>> +
>>>>> +	status = "okay";
>>>>> +};
>>>> Please make sure it gets to L-F (only Kaanapali is there right now)
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
>>> but the firmware in linux-firmware is (now) targeting IoT devices,
>>> should we use WoA-like names for firmware on Glymur CRD instead
>>> (qcadsp-something.mbn). It would match what was done for the SC8280XP
>>> CRD.
>> I think it's simply time to stop pretending the firmware is generic
>> (some fw simply isn't and some fw may come from different/incompatible
>> branchpoints) and include a board name in the path
> Well... CDSP is usually generic, except for WP vs non-WP.

Hey Dmitry/Konrad,

Thanks for taking time to review the series :)

The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
functionality tested on Glymur WP CRD devices.  Given that the firmware
has already landed, can I continue to use the same name as the patch and
have a different name for other boards if something specific has to be 
pushed
for IOT?

-Sibi

