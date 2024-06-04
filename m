Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62F413775E;
	Tue,  4 Jun 2024 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486315; cv=none; b=ahsSlLTQ707B6HfPoO0jrnGX/84ZYSNHC3ck8fkQRDgDAaKKyNiEMfDj2kyw3ZSDed4SCQOackPdVO+RYIkrjKVRN2nRdxAW973KZtPyG535Y8wK3L+C7GMxQcIzS4aWsvepkZ7Yx9rxxU0Fj6BvJlyTRNXPvCnDp+raoAYJopk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486315; c=relaxed/simple;
	bh=x9Wle6YkY/YZjGOIdLF2DWUVeJftw3EcWFuTPd6t0RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tmcow/DmxWMoSXRAwWQR7VkKyVxmYkziR1aZu7G6mq+HUbVpnCJsNZpUefZpaUwkEux8/yKqd5USUWAE5+amu5A7iSNtFlpmJKc32sVZBbwpCRXdXGifLX2BgV9HrxtXiDJ5YAPbXPap2mq6O3teYF1Ac/ORrSxsgwd6sAfue3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AOr+KKk6; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AOr+KKk6"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4543kNFU012859;
	Tue, 4 Jun 2024 09:31:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DeaHhKsAFkDX66fvMLeTNW/YHS6cIzY1RRkkbNP0vKw=; b=AOr+KKk6V7PkmSi/
	CVsPKXMS4lD3HLStWvjGdyMyuU7Jmx6GOAvWTDWCwNcV5VzAtRwC/gmTpAlmrSfL
	onndL1rOG85Ep3GEvTEbqYWhejRqis6mU4YoLKwQG0cRwpinomzdMxkxqRHourts
	K08cVdb/jYfwgVcYj7fTT8L0+5x4niqpGJT203kRQEAkeXy/SGlDzbKaluPspj58
	SKVCs/OMCgj2xSBN+NDvjurtohkQVwtZdLw9HPqz0hsonLzA8kW1Nhx7FN0Q59EG
	Cgxe4pdaRZUtukhKLfN8X5zqC4gjmagxJ+mcPv2fIlI+cU8Lxdw6Gq/QOQl7WfHh
	cIpJ7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw3wjap1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 09:31:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DEEA40044;
	Tue,  4 Jun 2024 09:31:19 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD9B1211F21;
	Tue,  4 Jun 2024 09:30:28 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 09:30:28 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 09:30:27 +0200
Message-ID: <994b6d3c-26f8-483b-8286-3780adb50b56@foss.st.com>
Date: Tue, 4 Jun 2024 09:30:27 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 3/7] dt-bindings: remoteproc: Add processor
 identifier property
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
 <20240521122458.3517054-4-arnaud.pouliquen@foss.st.com>
 <20240603143553.GA391578-robh@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20240603143553.GA391578-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01

Hello Rob

On 6/3/24 16:35, Rob Herring wrote:
> On Tue, May 21, 2024 at 02:24:54PM +0200, Arnaud Pouliquen wrote:
>> Add the "st,proc-id" property allowing to identify the remote processor.
>> This ID is used to define an unique ID, common between Linux, U-boot and
>> OP-TEE to identify a coprocessor.
>> This ID will be used in request to OP-TEE remoteproc Trusted Application
>> to specify the remote processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml     | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> index 36ea54016b76..409123cd4667 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
>> @@ -48,6 +48,10 @@ properties:
>>            - description: The offset of the hold boot setting register
>>            - description: The field mask of the hold boot
>>  
>> +  st,proc-id:
>> +    description: remote processor identifier
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>>    st,syscfg-tz:
>>      deprecated: true
>>      description:
>> @@ -182,6 +186,8 @@ allOf:
>>          st,syscfg-holdboot: false
>>          reset-names: false
>>          resets: false
>> +      required:
>> +        - st,proc-id
> 
> New required properties are an ABI break. If that is okay, explain why 
> in the commit message.

This commit is the complement the patch 2/7. the require property is associated
to a new compatible. I created this commit as you already reviewed the 2/7

Perhaps It might be clearer if I merge the two.

Thanks,
Arnaud

> 
>>  
>>  additionalProperties: false
>>  
>> @@ -220,6 +226,7 @@ examples:
>>        reg = <0x10000000 0x40000>,
>>              <0x30000000 0x40000>,
>>              <0x38000000 0x10000>;
>> +      st,proc-id = <0>;
>>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>>      };
>> -- 
>> 2.25.1
>>
