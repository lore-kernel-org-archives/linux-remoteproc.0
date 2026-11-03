Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699146;
	b=y0TaWxKlUWu8Jp5K13kcxlmOONJN9OaOWIk803cWWyUq+bzYFPDafHla2BbldxdN1mlP
	 aJAeqKFGqolo091hK+g8P1Y16ky3B1jVM+yMGnJM30ZI/JSQHhMQhvVMumdavDjl86mM/
	 u1o1H5yN3eS9yKdubzu7/NFkbfxiF8hTKy1lXhMGmXeDQ6qnbAHMZTavlZN2QXeKz14dw
	 NgGDarHu+vr0LbcJd/K3oBth9gpBzfPjFZ6JMVLBbYExkECF4T0J85iIUhNLnI1oTKoJm
	 k9yfJcsFtIvHUz/RJEWaKR+3iQD9Nimd0R8VyjWaerf9SHglLTscuQGALpEsmt/TnUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
	b=2lZiL8nmY2X59yiR21Zeg7TYjLxgLVwjDc05SILG08Kq7Acr5z1oVxluYuZhkemmB+fB
	 SZK87oyXCVKCxazsNM+TEbIOB65Yp/PLJmifm3vgsuBFr2EdHlj32kLnffz1caH/n5e6+
	 gOEpsfzecl6RX8ZBTEkggt6oYTrACIDuudnlILsKGSCENwJzX2r0rr8TSML+940dM+Q42
	 7eZxzK9PfANpiafZPgtT77XGN//hcbMq0fMbhmagLaOk/zs+bIHXuFFnkyuqIam3zjKBR
	 iSy3vievURgdrkTh0C4JIqEOqCM2sdBLxgsDncDBPo6SZKW7zFEm0bqFtWNbeKsKoAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fom/uN9J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzKArjKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A6A606A326
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Nov 2026 09:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fom/uN9J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzKArjKr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37tMdW1434767
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Nov 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=; b=Fom/uN9JKIhHz1B0
	mZDkLS6DR6brE5JpHk4qmTzxX4+ts65C7+kAr8BmO1VKNVXxxMWko2pyxly1QL/y
	yA6/ZPYOLqUE1642Syd+Wed00Pti/DAwoQ1fQ6snCDfHq8zjUi/VLf6dsDvJNKoI
	chWhvzsjRoD7PEDStUM/TCvpxocx7/uShEpNOB1/Mc+CL6pkzQVIQ4qeqTX6TaQA
	nSOeOvohEfjJXfWPFzMILkCfATfCgSmipQS3q9AhJVxGYJ2oDO44mVSnzS2nHhEF
	RXEs6rkCw8vF3L9PThXHBqOnpzDg2ewiZgiStyHoyNh0faUw3jJ2WjXrKQLojs/o
	tE0a4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjgfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 03 Nov 2026 09:45:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e987ec84afso33110365ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Nov 2026 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699144; x=1794303944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
        b=IzKArjKrXiSJUGeHRy1S63+WyyjzqNrLX+8THr+ned7T1hGmHOB7+bWqSGinK7YKGc
         XpBPvrZgFeRTvcK3w5ZZlzsJHI2Yya2R2iZgWQyr1pY6HyEb806LLQ9Xgen28eK3598c
         7TxFRa9HioCxC+BDBgzhO2spqnxABZL+IeZKlP2CNvIUc9Ar7gwW1gqSMNPMLp5JtpCN
         QHvUk/UJXC9MX4Uw7OF2bV0ByYG6J4yi8PJlrUShc5GdwC3cFSNGkz0rsESmrFR+c/Ok
         cYt8kCUyI5DvWlkkJHL2t2Ja5fqwV905jLdO4lst62SBFJLB0pEa6aAeHwR60ZFd109w
         W7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699144; x=1794303944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
        b=pyWAN6fagK52ggkFzlJsDf3zyHJajSkrIqd03qInJ91dB7X3Yl32uMBhKhgOuUC1Oj
         Ykas28CsEmSCN1pJgyS8OOHByL9fjx+49tolBNuhitj33JrdY4qpgM4FxWABZTmIFovr
         wJraEwbhwcWXDrFoQ3oJUZNL2soSByPMFAMpTfcvAWuGHqnCEWMtHHgALIJ6QTK5EomS
         yB3KUEd3xr8V7Xi75HAvday+PO8030AWbtFcsiR/tBtruXbosng1RFjjVmjqIyAS372T
         qOk2QGjCXC4RXkEJ9OoBTir9w+sSls7Pktpa81wKuL70N8N9TyxWglVyNKaCtWSj4u/Y
         jI7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8WblhCkFJmGG7IJHXbHJoea1UTnc3uRuqMa6Vb17G6HaA640YiaiP1hTUmGb6DR+4ngpbARDk4xc9PJV5vfS8@vger.kernel.org
X-Gm-Message-State: APuU4Z+XDb4gz5A9C8UbfcEGJvufA0v9OULFBqczSu4E4ZMXJ8UFJfxp
	FzCYq5oldRv6SvHu7JV4KhyexP5CY9p++DQ4GoGvfr31gTtsgAwKEshEIb/LYfeDT0g+IPwy82I
	6rh9JMudKM9XtxJrd/6yVXLryXQ2qV1QVWRMV/QEyuaxGnfpcUvdsnG9NZ5igqt883gBHk1i3
X-Gm-Gg: AYBFou2OewyoojiNgtTROjTiMDbgVkJ08erkfS5oUeHTo7IowW0+QPf3yg7gscvA9/V
	9WFpHzfDWBqqUDB+IrNgbQxVT+BsV+0qCuZX0cFZN0vDBfGLrEnnedQsSo2nrLvuygfNTtnh+Yz
	LDzGp6tVOJ3MU+M8PgGQWXSZQzLL9/2OVx8Z1IYp/gUTcjfelLoPwhOOf48tTsU3xffoSzZK509
	JKNcgw3iSf7JRzMp3p8lFQFDfwhgmLPaQxj5SU/n4/GLwjuFDa1vX7ELvKZxvdi2+Z9WnvhmVw7
	WJd++pBQ0RO3YzeeHRPQzwoH7gTVqN98e8PRClLId2UGSkYdjs9r+5jZIhZzFLSkS3j0f/gBKvb
	4ztS4wi1hYuyIIpUHERcz7iT25H0hoHJiB2lF5vZVxLgYdUEqIxXsizTn4Gsr/mLDGtk/nutKpc
	s=
X-Received: by 2002:a17:903:228b:b0:2e8:3190:73a with SMTP id d9443c01a7336-2eb364892f4mr119896015ad.58.1793699143782;
        Tue, 03 Nov 2026 01:45:43 -0800 (PST)
X-Received: by 2002:a17:903:228b:b0:2e8:3190:73a with SMTP id d9443c01a7336-2eb364892f4mr119895795ad.58.1793699143296;
        Tue, 03 Nov 2026 01:45:43 -0800 (PST)
Received: from [10.218.22.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3927e856sm37288925ad.50.2026.11.03.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:45:42 -0800 (PST)
Message-ID: <20e8628b-4664-4b61-bf4c-bd25d7cd6775@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:15:35 +0530
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
 <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Content-Language: en-US
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
In-Reply-To: <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9ad48 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8PPq-ilK-3aRn1NlK84A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX+EhIR5W9eNAt
 Rg1Z6WGnfxibSk0oHEHHLOl1Ie3EU9tH6R4KsnChxVFvtF93SWzLOPq9YEsCq43R93Jd8bxUgIM
 X7ALJVyvgUgX3qLdwQJO4IgYnzN3AkZEXbBQTaoXx7xVbTcRb7+xqipLvRtXD86jpICIk2WZmWl
 NvNsxWsy20nIr6hBnYTya2+urL6l8jE4PhlcBFsoAcwWGnyDvThShDZPVLqYEayOMPH29JMR+vC
 In9hS4e2FMCzkd/UD0Fb6jCb/JOKQFRGZLO4Lo/ByJbLGRl9G+e5Hm562tGw0eksujqdw7H9rlJ
 N2AirEwgp9rmGvd1TIycDm8Xb/S6CcdrOL+y15XQYfbpN8E0NYA2u8PvhlD02qSCPL/7kMn1C40
 y7gelGs6VmNnBfgq6QVlKLbDBud75SwTWxkcvwp+yIANODWnDZAEhm3c9OnZpVePKbhrps2k/6T
 ckdUEHY30Smx7YO9XOQ==
X-Proofpoint-GUID: RpIZsFHyjU4rDo7Pkv-wJLX_X53zQEGU
X-Proofpoint-ORIG-GUID: RpIZsFHyjU4rDo7Pkv-wJLX_X53zQEGU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX+w+Ni6g1Slnv
 x61s6b7dvojASOMvl6c3VPg6CevfrZqtarEYf8rgPUmY7w1/G3e53bu9ao1fGAZLc/h6TIlo8Z4
 sfG84u8EfvZWr8AHbHwDprmq6VvwA0o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038



On 10/20/2026 5:29 PM, Konrad Dybcio wrote:
> On 9/11/26 7:03 AM, Dipa Ramesh Mantre wrote:
>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>> when it reaches high temperatures in shikra.
>>
>> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
>> reach 115°C using the QMI TMD cooling device framework.
>>
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -				nsp-critical {
>> +				nsp_alert1: nsp-alert1 {
>>   					temperature = <115000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
> 
> No "hot" points? And no throttling at all until 115?

For this target, no throttling is required until 115.

> 
>> +
>> +				nsp-critical {
>> +					temperature = <118000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&nsp_alert1>;
>> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> 
> Please align the arguments so that we have:
> 
> <&foo bar
>   FOO BAR>
> 
> instead of
> 
> <&foo bar
> FOO BAR>

Sure, I'll update the alignment as suggested in the next revision.

> 
> 
> Konrad

Thanks & Regards
Dipa Mantre

