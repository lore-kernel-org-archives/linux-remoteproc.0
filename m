Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333109;
	b=AS9f2xtfKtzRsN7TYOkJWPd+7S2VB/oRy9GjnRcn2Or+4LWyNk5jObxkf7RIb1TUvwnE
	 Qx85tE9XrYTjRv+O81rUIcP/2LE8a5Oaq9Ao+5721cDvAk5hxNg9IY3ce2YtSAQ+8lD6+
	 boJSC46Vp53fAIsOS6NU79gD+Z7dSMphaPvAYVgyHKz+OipPmlNaQlR3+FhJTpVG3H7a0
	 TaehvcDBLssxxUGrnj0mb9M2rcIwbGQt+OYJ3LLZ+T1EPIGFS4mKZHQQqN4fPcpaemH9e
	 2mcCai0Km9A2AJqKpj2MMyLZkfNeEBpP5eOHxwALNncyeu1Jc6SoGWSfKeWZUwgOfEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kWkhdha3nQ+YU6W68ji72ckaJYIXt+RZxT95aMd1MIY=;
	b=3wyxpIX8nZZT0+jXSCpaPE+ZUW4HRVZ95NwXdGUHirhYb7Cg4efYk+sFSGDGFNID5Wpb
	 PV0IEeoFOu2JEUctKwNz6rdiVTQO6Rs35p6V95/EB9dutpwylurzHIxo+IUDOu48uAw40
	 V070T9+HLz3cccVQ1xS8iqUoqhAIGZt96gx7w2BWcoIoOCOvbUAs59RJjkBP2YhL985QQ
	 w2r0se2KF3XIcFwv32A7J763Ebz3XmGms/PUTLv27r4WNN+M6h7yDWV1E1Dq6HUIBZyrX
	 Eh/vLvMxGxjRyN+O1XTxij7JDFJJ/NEJWjrj9xh0ImEfGw79O4O+ojA+u9mH9eAlQeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0VRE6+u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhjTvkNK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4367F606A325
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 17:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4367F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0VRE6+u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhjTvkNK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF03sv3671626
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 17:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWkhdha3nQ+YU6W68ji72ckaJYIXt+RZxT95aMd1MIY=; b=k0VRE6+ujr9qu2si
	19L7uwDIWPgQxjAmR8eJP2soTnbTuM5D6BQMVozfJbxQ0VQDoa7S1cka+tgxa09Y
	VdVu2XC0aAvTwfyA0hJuDbWyhS/bZ+Jcb8JWn1/LdU+d9j2nV5FVLl/g3kbRWfP6
	x4m1rNg7w9iDDTRbobz8MTLGVteEsM2zFce/SZRSOYugdSOyMaD5l9g4BcvJ41x8
	+MN95ZZsvY70KqIztZY5BnW2kLtnrHQ5VfYUJ1pImHrhMNRHaVi/2wcOv3Jk7F7f
	JQjFWqzCvAOb4Uk6avwkjcyZbRlkzGTZQTyE2ho+gxcD1LlOfrooT+FhiOX5NS1o
	yORTAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyuft2g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 17:51:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so432851585a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333108; x=1794937908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWkhdha3nQ+YU6W68ji72ckaJYIXt+RZxT95aMd1MIY=;
        b=LhjTvkNKJFiERJGV07Uii06XsbJ6UsIHgozMTnQdLN+JYj0eCYro1rFCZUjbO2ylPM
         7nn1+d1AdeVUj10mIQlSt8nJvP8GBN9YEJ4YBhLQP/anlcNmTnbDt3eh403RC1y3u2iz
         8TwUniNacoYl1l5hVsf3SMK9n5rzfMGdLa51TarjGYeGZ4w54y0j6V4cCxFfgxG3VrYV
         KccRwH5FKwwvOPbgz7HO/kiKQLDZY/TvIdhTpL94ydjXRVxhUmglzBCg9Zx3hWmRXM7z
         3xhPf+4gMTmskmKejHdLXyTjGPIK7xWIjn462pYotxDSxp0dM36WYkloHsRjheH8Mf3g
         pxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333108; x=1794937908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWkhdha3nQ+YU6W68ji72ckaJYIXt+RZxT95aMd1MIY=;
        b=R+1lDdjX/xe5ss+e8x7OfJPWhzY73ETawDDvLCgapyNzRrVoR2fDHfdLczq95FUBd7
         Xv0HUdq8VYkqWHNb+zeXomc2P8+7QC5crx/KTk/K+DNNr5UOr/TtslEml6t5W723u8UX
         MLiDth5bCRV9EGcbOKBKAHJf6vx74PkiAR1NGtOYwGSQGsBtxxYSjdZQ4KC0IXbn3TMW
         qwwmTk0WozrC7RFVSYrTYN6pJR21lGqB+7i8dPU3r07tanU1muU04CZKVK0UX1DY+2P9
         THXonQe7qD6IfljiIumWWr9MxfJRnjyNU2Mh8ajRinAylZxqtLCpSXkF8yXncJv6CF2y
         8M3Q==
X-Forwarded-Encrypted: i=1; AL+hErHdlz7J8QxBi3+FH7xG9pGPtX7gcV5ecuq80zWytW11xXPjjnXm1WmHJBii4+jhKcKXqDunDb/BFAaOxZ6+o9kz@vger.kernel.org
X-Gm-Message-State: APuU4Z+PGdw2MAmdU3stqa48RPdR0yLYlwBuEg+lfaAczKyCcy84ZNvn
	1ccSuTCFbcKQVwbs/pZfejPWpXHlsWYBz5WayK33briJdNLGkDfroQ9jkmR4d4++94O1MNzwpg/
	XBEOZLRlaftW65JB3LN8M8guzWeRmOGogL/glXv7ZtwLDqcmWLP/zw5ytQY0OxspFimg+q5Ow
X-Gm-Gg: AYBFou3Zlud5aFdeFF0nQ7eofBKxK60YLtvcINbF1WpqkNy8KzOrpJAwZCJI4LFjfPf
	vfOG3mi6jxgH2Ck25o4NleaIZzP5qL0hyXd7yg5mqLfQm4S9Z0tGqbazelYGF9oRSSLkZSvyuK8
	wXXeupbwXt4rAP3yIPieLe0cViuodJbuYRhkPHbRX3HQs80f5L6ZsyVaxqJCsnJOEL9RAib4hg0
	3Db0dxtnakAWdAntDsDVjRFW07wxsWQb7i8ZWNsQIYejv4nyp3Ck/qhjegntYdZ/7DEBoG+4/5r
	Km3nW4xHU5iTTuZdNTfV5AlYt3D514BnkCsEdZsdIftPQ57NdnMjGdXWOsyu0eGp3SUHtD0Iwkz
	rDyDOvMU7G9jdXnos5DFGrVNYzqvYVk6CFYdni62AclYhzjjdBbxKeUnHHr+yR/NnVxWL47J9Bg
	75
X-Received: by 2002:a05:620a:27d6:b0:945:fd9c:b26f with SMTP id af79cd13be357-947ae71efb8mr46543385a.2.1794333107609;
        Tue, 10 Nov 2026 09:51:47 -0800 (PST)
X-Received: by 2002:a05:620a:27d6:b0:945:fd9c:b26f with SMTP id af79cd13be357-947ae71efb8mr46534885a.2.1794333106894;
        Tue, 10 Nov 2026 09:51:46 -0800 (PST)
Received: from [10.216.48.249] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578bcc7csm1415476a12.10.2026.11.10.09.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:51:46 -0800 (PST)
Message-ID: <3b00916b-d47f-4b37-8142-2d844993e7c4@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 23:21:33 +0530
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
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
 <20261105-bold-seahorse-of-reputation-8db98f@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261105-bold-seahorse-of-reputation-8db98f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wRSJwWHpmu-djUNrvNcN6oDrlUUfIaUP
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af359b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BJdym6yNp6BzvLZH3dgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wRSJwWHpmu-djUNrvNcN6oDrlUUfIaUP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX1aBLxbEgXazI
 san22ZgjG2PKeNBY4USfrEe6QC3EVhaFjyoonqOq2/DbScz6YAEjvz4WaLXbOzncmddegiy+Jod
 yh7vHqTKzT8XPQjOVDX3Vr/7CRqe3Zk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX2jxwUed5OWtv
 8uPJyVCJyL6odtxA70K7CJaH1KNiTNqset04pWYJvz7CNmWEIMCEk34Pxf0dCe7lkf/TksIh9bg
 8zsrzL3/HGpM+/YC0U4h+2qPy7I9fvkIz+aIUx/4t8HUemEoIv+mIo0+WoOGJXQnu6eLfB0+uPl
 mY7ejSNFx4SCnZPhtW8JiJml1zWKTxhnma+AIoqk+sHTchU5kWZ+S9DwuhmULZ7fy7AU8HMpPtb
 EuZNJdAnOWB6nuL5Nulcq8qyZbNheG/KeKy3Y3wX0dYeBxfK+JWY/wdIBd9uzvirI3H/rakXZSc
 a8oWUmGh83O5MVSaGFS2S079RWe7ApsClCQ2vBYVEgPAT5uALXbrEGw4rClRHdXGPA1vBhv3mBc
 UalnqsuO/4QvcoWKoJ/ZCfO3eKjFLdLT/lBFoQwnTrVEOSJDGQLkyvCRfx0uuWrArdU0eAbtSnb
 D/30bGusKUalyJYJSNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100071




On 11/5/2026 7:06 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 04, 2026 at 07:33:31PM +0530, Komal Bajaj wrote:
>> Add iommus constraints for Shikra PAS compatible:
>> - qcom,shikra-cdsp-pas: maxItems: 1
>> - qcom,shikra-lpaicp-pas: minItems: 3, maxItems: 3
>>
>> CDSP uses single IOMMU stream, while LPAICP firmware uses three.
>> These are needed to describe the firmware streams when Linux boots
>> at EL2 without the hypervisor.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> index 34a2f15e9361..8c8a7616d478 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> @@ -112,6 +112,8 @@ allOf:
>>             maxItems: 1
>>           firmware-name:
>>             maxItems: 1
>> +        iommus:
>> +          maxItems: 1
>>           power-domains:
>>             items:
>>               - description: CX power domain
>> @@ -134,6 +136,9 @@ allOf:
>>             minItems: 2
>>           firmware-name:
>>             minItems: 2
>> +        iommus:
>> +          minItems: 3
>> +          maxItems: 3
> You need to list the items.
>
> Why maxItems? What is the limit defined by top-level?

There is no limit from top-level now, since iommus is removed from 
qcom,pas-common.yaml and not declared at top level for Shikra.
I will list the items for qcom,shikra-lpaicp-pas, with one description 
per stream in next revision.

For the single-entry cases (qcom,shikra-cdsp-pas and sa8775p, sm8150 and 
sm8550 bindings), is `maxItems: 1` fine, or do you want a one-item list 
with description there as well?

Thanks
Komal

>
> Best regards,
> Krzysztof
>

