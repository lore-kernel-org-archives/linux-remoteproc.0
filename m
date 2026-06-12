Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458413438BA
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jun 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272385; cv=none; b=BbAPDgBjs8bE6/Wo1MUqJ38ksV49VKX1FYFnrJzy3W0Ov5xijUbXtce6agwU/agi+oCz+MPYiJ5IRM/6yokI2ScCuln+0+xhtgwIrdvrz9fg16F5qoD5rn8We1LXE5ijEDHRcqlVHBgAxgkX/y7P6OuFSrz+9NUDoECEbw/6iGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272385; c=relaxed/simple;
	bh=rXCM27CI+q3bTwAWRJkzblUZ2cY/BDik2t113jUneK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWhzg+L6WX3GMa+bmagHV4yXMvgOEISRbH/luequ9o+h5VREzIG994nUCnyWnYCrI0QVXDGCUgrka40/hahMovrmGU0tnUBj23OBKm6bocmILLcFZLIu3a4zikuVY5AYy+4aJAjOnPGHcYvImlJtC+NKtoMaIyydqgHG/NdkT1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkYtDQQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/M5Br+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkYtDQQw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/M5Br+P"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj76L3661888
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jun 2026 13:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTnfVI4gotUQ2bkxP6pmXcdIqm6lxSQhArEpxlHE3ZI=; b=QkYtDQQw/ZsdVWqT
	HYHVx7VdGUQKUBiI6+HBXseYRkL7tJXUPoHCYhGUDJC6RFYsokkh8F+TCMzNYSN1
	kXFu58eDSMCL6mILiFp1jQ2+hzZ0fP2Jh3H0Tl/QDoeDpjvC0ZM7ewPlF7P429Fp
	G7t2Z+lyDbJHPLf12tH42slt2ijXFFuc/mEkB3G9FhnSzKOjx/yWNijTvqxbRr9Z
	sEOtP7Jtwa6Ot9LJMpqhGARPg/6kkloYY/ODKRKtJ+Q0cka2hvTiNPWdcYmwcnrp
	Dac9R8Pju8OL2nMyyK0A15fX6y1pRMMjpqY0mBHmP/IMZ27LnI6S+pnakTkTf+x5
	l5U0LA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xck9t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jun 2026 13:53:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf004bf8beso12850635ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Jun 2026 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781272382; x=1781877182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTnfVI4gotUQ2bkxP6pmXcdIqm6lxSQhArEpxlHE3ZI=;
        b=K/M5Br+PbxxDAQeSR2ELdnqVdHLnevS34SufeQTDpB1rB5c28E+iXbQ2WO7NwdVTwA
         2rEla8Wjk4GnXILyaUFz3O/e2GrwV7itcZjBXOcqd64tU4jVwEFFVoah1EcA8tp3lIjS
         asL9cr0rxASsjZnpx9um/Lzp4hGDAryV5Z6DGQ3Amwk+IVgDD/XctyW87CNaW+65AY7W
         BYbSCgX6/yR22Jk2MVD20dWt+SDYSrlvSREPBRVtwEe6i9J7oELCBqaDTlqzY5tivAib
         m1gnB+GxyJkQsq4ULASXOVZqeHrd+Lh5w8/x63tSgPaxPhqEehnNFhVIz+RMWsMUxLVP
         qf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272382; x=1781877182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTnfVI4gotUQ2bkxP6pmXcdIqm6lxSQhArEpxlHE3ZI=;
        b=jix96Gac0xyE8qqpQaGHNmqRwUi+P4q6R6sCK9DJdxZDfBeD9xV0ZIAs/RSw3LZ5g5
         L2+yruo4b2zJtjK3VGyoP4fNpC/X0wIBk2NRS90qVsL6AmxNNLXKeJPzF/2sLFOUfJ1t
         HDCaGZJ5x8gaqtKHmnmFS0IXsgSOBVhy/84XuKFjk0553ohxiO5+aQr1cSWA01x2RLZG
         iNSNteNYsK0rmxaS1n512euZd7Nv0cLhRvJ2UPGzE2MuntYZFDolLC0qaSf+dJaEihli
         46bslwMfvUGQlIV1UaxirGNS3FapDpKjD3nOW0mssfdhP0Q/1yFpSL6RTS5C4yA2VJX9
         BWhw==
X-Forwarded-Encrypted: i=1; AFNElJ854wKpHAq59KZUaaOlBOd1Disc0qP3W8GSGETJdH7IhKpyatbOa2vhxYgHbHUxhLtnMhlfYDtTQW3n717Lc8L7@vger.kernel.org
X-Gm-Message-State: AOJu0YyCXO+NMgwprRfiSULL3mYtIxk/uNK6cm3karO0HClLNBK2UhRj
	PzblW2CUb97q5uZF7Tb+Pu7gZyFBW6QBMo81gFoh8+DGrtLS2wj90zkKRLnoIBW5ZqH+4mIjAqB
	yYsiyX5+iKyXfjE2zaKBxhR/E5zFTYlKGWCIRkcMc9e+oAFKzHabgLE1cN7S+LrYrrOpI57bc
X-Gm-Gg: Acq92OHVzNhSRXR4hinpQpxdMYzWbVvCVfOigEvoC8vfvzESxtIzfcPpGPk8ZWxLWRq
	ailpy1RgTJxVRFCbr7NPEdHIV+8BPntEnukqGV6JmGI1N3B4S9AcnF++Tq2s1vvLTMBs6ojkXLK
	2qvJyntaQQ3phRg2E1Pp/p36QnT0VMnMQX6cHbVLrlwfNW1yKZF0gTHihSTkXVl+al1z22AcYps
	2uODMvfmc9Z+2cFoZKbHB19c73t3KJeD5Y/G9XsRNr2PY00Ht5GBwqPaay4r0cGJr4LMfK6ivUn
	T9wywZ/t9fg/W9oYaETHJyfAIvsDFfWgKDsPRkNNVRO/Q1onPYub687UUsW7UdRBE9p3QjH1vvt
	FO/2Pka1Z0UHgn5j9c/KUmlHENs3WRM/DG8oMi2pAPiisJorcHyda
X-Received: by 2002:a17:902:fc8e:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2c41198107bmr34271455ad.22.1781272382186;
        Fri, 12 Jun 2026 06:53:02 -0700 (PDT)
X-Received: by 2002:a17:902:fc8e:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2c41198107bmr34270905ad.22.1781272381504;
        Fri, 12 Jun 2026 06:53:01 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb4134sm19641415ad.30.2026.06.12.06.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 06:53:00 -0700 (PDT)
Message-ID: <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 19:22:53 +0530
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
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyNyBTYWx0ZWRfX019R23ep5iQA
 EBqMYewz09MorjqYlFywPYICUzLumF7ZbOrUqNkLLoaqv/YTK43oXelPeChgI3byFXO8ypqE4JA
 UWmXy5KFuO+kZSyZufuu7cQXUyAdPeFaRuXtawusHue+TE9SZkzTrXAAOVciFs5+Ta2CAr+/Uie
 C5dEwrjxkhdcdA2cw4sI58sAgMx1eYXP26/Dfp7eJjY2ONrtwXGfft9yB/qlC8VgBhyIcCdvJ6p
 RlvBbSXzj8QLPp2Ss+0ZQ4p+B7wm+7PUz9wM8sV4905Cpaa9aG6Opk5lDLExVs06oU4p+FBxuah
 7xWip7EB+5slVcnqj1WH3+HnngDbGSHjv0dt9CrRV4gb2hMtuD+an8jdVlmljDxheNWf6A9eYRE
 PtCFbNWC1cQHycIRk/s9YNnEpqB37O6OrEIJX3iUPtKxOGdZz8EX8ibEDm5wx1kjzh1Jc2K0Mly
 2yrmZP6mJijni7SOt7w==
X-Proofpoint-GUID: 2AEgdXxhodGGvaN_n1MDet4aTKVIVDnw
X-Proofpoint-ORIG-GUID: 2AEgdXxhodGGvaN_n1MDet4aTKVIVDnw
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2c0f3f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mCNVnkFJZU-R2xYHr1YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyNyBTYWx0ZWRfXwgQVwZjQxr11
 2H7Aj6eMNGY7ia/bvyFupaCeNL3cuZgPMnGuFkjEcTx+GGTKj6o++LWu8kngKzKFEKDyy7KAuKM
 kPJkBZ5twPOlj2u3mQ+gBIiAqHWUziM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120127



On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>> Why? And where is this generic property defined? You cannot just
>>> sprinkle generic properties in random bindings.
>>>
>>
>> Ack, will add why part.
>> These names are matched with the thermal mitigation device identifiers
>> populated by remote firmware over QMI and define mitigation devices are
>> exposed as cooling devices.
> 
> No, -names correspond to values passed via DT, not some remote firmware.
> The remote firmware should give you interface which is explicit and does
> not need such properties.

thanks Krzysztof for review, We need tmd-names because of following reasons:

Following Daniel's series [1], the thermal framework supports
mapping multiple cooling devices per remoteproc/device via indexed 
cooling-cells.

1) The thermal framework's cooling-maps reference
cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
there's no way to know which index corresponds to which TMD, as firmware 
may return tmd-names in any order.

below are the changes post new thermal mapping changes:
DT: tmd-names = "cdsp_sw", "xyz";
Firmware: ["cdsp_sw", "xyz1", "xyz2",]
Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)

This allows cooling-maps like below:
cooling-device = <&remoteproc 0 ...>  // "cdsp_sw"
cooling-device = <&remoteproc 1 ...>  // "xyz"

2) Not all firmware-provided TMDs should be
exposed as cooling devices. The tmd-names property acts as a filter,
allowing board-specific DT to select only the relevant TMDs for that
platform.

[1] 
https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

> 
>>
>> Without tmd-names in DT, it is unclear which index corresponds to which
>> binding. With #cooling-cells, tmd-names in DT provides an explicit
>> name-to-index mapping. Please suggest.
> 
> I don't get what is the index here. Index of what?
> 
> 
> Best regards,
> Krzysztof

