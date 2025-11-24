Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C0E231827
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983231; cv=none; b=grK20VOJPciAk6+68hph5pnHM1QtiUcquHl7xO4PjnSDETu8gQyKaUNaKSBOZU9Cj8qjoHf6eiosaI3TBP+w4xzaDajDQlUlL86STaenhr2MJ5sUs/hpe/SLmI5uKVo3y1hPpaskoqNHR8jfadqBtcN9v+w6OVyx1ptkGFuZZdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983231; c=relaxed/simple;
	bh=ryVs9I5M3l65+eAMSkFhEug5JYyljUURrwLgdtsuCQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lv8baedJOn7EwJWJx1UqIgQ++ztU6yC38u+85FEthFqQNvclF8LxV3Bh41nngQR5OS9uiZj5ROQ3CLuGksm6uSYEH9zAEBd6kA+6pD5zWcuQZutUI9OQB4YeoVm04XpU3xW0mgCj8J+Ifop0xSq8h2VlY9K4e5QKk98Wtmt6Eng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYjOOBN9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5lAdNdF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYjOOBN9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5lAdNdF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOB2qZS3884377
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BSV3sAHeeJVuK5Pcnq3kcJfhY8DOScHIXuVIS62Z0TY=; b=OYjOOBN9i15AunCK
	fEq92QoAvYS5+3haguFb3KD4G6+kVRMB4oqcO8w6G8f/KWn0oTihZOS74QHVyFw6
	UF/TpUw9tSHgZIXVCq+RRezSGrBwCH3HvlerYnJhg3tv5CnJ6vLOUWsOcUCG8lAY
	ID902xxrf2CXk36X2p0/i93ranTGIT8Zdu+D0Az9gji+CXLeqmLEPQEe3/twam0B
	IUJO98EXtCPMBr7ua66zGgnKTkeglaK/hHNm1ZXdd/x33bcdWDovuhecI7txuQxR
	IkiMqYbtUHkGfVRjxtw9BDpiQtPkeN61x+av7HrJ/ZNsmEtBHQQApPHbwe5U/Rn0
	li9Kkw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp5681hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 11:20:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edace8bc76so12902411cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 03:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763983228; x=1764588028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSV3sAHeeJVuK5Pcnq3kcJfhY8DOScHIXuVIS62Z0TY=;
        b=B5lAdNdFg1zKbReTb678KTlnI03vWIOvtNCV0T6SC5YDht0xXa+R9d8iSc+K6CDKek
         ab7LSA4EZD5OMPyr6J8QVNJasxvzjccrBMavuhxJJe+Ldv4AH2XA0TRYubsHNG0v3p6T
         YZ1MOSnwKjjizVBZggaKgjNh/qajMapk027KaQ4VVx5cdgkYTj/hKBj8oaXJ8PBhIBaZ
         9b32RHvikMIAoYBxN+gO/LNUedElFUg2XyyBgz37hdKU7IpSSXsTwIv7Mc5K2tIcSiFR
         fl6OHl1CI0Uqzbm0FQj3AzARfAFaxXtIYJgzpmVbQVU3ZDV5Kw4+B7VPIL8jn+VCiTaQ
         Oz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983228; x=1764588028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSV3sAHeeJVuK5Pcnq3kcJfhY8DOScHIXuVIS62Z0TY=;
        b=QVp3sYWAnziNjRC19Dkn5vSKRSiwuah1dvFdNzDuVTJ69/obu9CwyxOUv00va6un5u
         Q6C3xn8N9Pkaoa3TtVTJa1xBdkjXFILKM10VoJfaq7nffioz3erhviCv9LtQXrvGsahn
         pjPI4TSmigEv0M22kw4ZhjfLR+m8OyFsykBiT44AOI4occZn6Jb/RsrNiqEJrcLrKrY6
         BjIZW8JpcLd+5cLjgxfn5d4IwOHGvxk0FExMBNIg3SKLL1kK+GhBveR9kL7+ocBdxbdA
         X6jPN0Lt45mFsEa4eYUM4a65tz/fohNc8mV7/T8HHNH/QOFLrcPGac2SBcFIhkO8gqqn
         fwgw==
X-Forwarded-Encrypted: i=1; AJvYcCWL1fGu5JmSokl/FholuA0UpBEKntdjVQYD0UT3mV32CyKIHsJw9tcqBYg5j5FmymbCpFt/sEiyz02QFcAO9/vd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh3dbOvOyocxbluwvLb7ju4pWGM/LwXMHgG9oPg913S1HEGZIb
	7vOVyqh9BccoCQHiZzbWyEy37D4z47sIhBWnuQ8EIdSUVgvpGXXfqw6gPP95AjXJO1xhW+ONvf8
	7zVx5Q5C0Vq2m6Rh8pS5UDA0OzhGiUfRuRi8+5X8QMnk5/JarAVOmYF6RoznEOVC/07ei5F7W
X-Gm-Gg: ASbGncusFVp/YkZKqbkwYhwJB6ZEJI809bhz9cPM7WjSF+g1bKS/OqhKDKDnl7cVyYM
	UdPTqBR5+o5BkSK6qTXe1JfoE0Q5mRxcEZ3ci7PVBheLpq2Xm7Ol0cDVtE05/TkF6nwXv8AtEgm
	jntd4cnhdMeXPsxwz/p77qDaqPeNDzUrUl0U979OLulmr/WzYBRQu1ndoSOCW/m2P+6HnGfXvvc
	Qhqv5IAHcsBq8XjqI/68b+WIazGVKsE7YDoEDAT2Su4HkTtHaHYC6xRMJPAJdskQBDbyhRoEMTv
	crvgvnK57UpLLuqhN7DdxRjrVpQsvY5ttl5Bi4Asvpm/XP6p10uH3qR8N8FMhjgi45Cl4eOC4Ow
	+8/QZNftzkIGirL8LmNQQMzVtw5nc/+3cfO9JUrj07KN1e0LLS8s6CMY6DUmcuZvdrFw=
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee5b6fad57mr103922701cf.5.1763983228016;
        Mon, 24 Nov 2025 03:20:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR15jx1YOLqQWEv2r9w6P1o+SVbw4CilC5v2yYmQGkKlKIVzrKmx0kXCcc2Pj53olgY9s0mQ==
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee5b6fad57mr103922461cf.5.1763983227641;
        Mon, 24 Nov 2025 03:20:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536442993sm12371722a12.27.2025.11.24.03.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:20:26 -0800 (PST)
Message-ID: <2fc83dc4-16ab-470c-a6b2-379dc3e52744@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:20:25 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-12-8e8e9fb0eca0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-12-8e8e9fb0eca0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J9MvAD8ChoF1k9iNmI6eik2vKaYQhV2W
X-Proofpoint-ORIG-GUID: J9MvAD8ChoF1k9iNmI6eik2vKaYQhV2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwMCBTYWx0ZWRfXyWzLOzE3etkr
 Il/VuF+F1TOWLhXKRKrNrPU0ERbqvFA01Bsm3nO3peZ7Whz+Fn5QXcbmZFe/f7bir5hnZi7oqr6
 YK3oMTClZq5olL9ARg9MoVAmpGilPEwWQyGhqMb456t0i/HrXD17dx77t5NVTVgO6+C1p/sxJZV
 oQttRj+tHcesBn1F0VkUzIw5Jk8uCLst3OO01xC1aEn8gkBsa/0kQy6LP+bsD6RCty/C0PWlpE+
 AjZ9dWW7/9BZGNht4AjwcZ1GOTLSVf+HEA4k1KukC/jMysml6oUYxNgzulgeNLMn5cVMti3Qba2
 1bMvc81Y9WVjen01mgVhau1vXOV4EMq4z4KwinxpqTzz8QXNN6JOYy0sOZ8V6/BCKoMO7Fv36//
 OXHmJxs0tgVDuvU6DFxh6RIe+P4AKg==
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69243f7d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WVEJiFBRDJ0UJk8ac0oA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240100

On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on static and dynamic resources for
> it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> or older QHEE hypervisor, all the resources whether it is static or
> dynamic, is managed by the hypervisor. Dynamic resources if it is
> present for a remote processor will always be coming from secure world
> via SMC call while static resources may be present in remote processor
> firmware binary or it may be coming from SMC call along with dynamic
> resources.
> 
> Remoteproc already has method like rproc_elf_load_rsc_table() to check
> firmware binary has resources or not and if it is not having then we
> pass NULL and zero as input resource table and its size argument
> respectively to qcom_scm_pas_get_rsc_table() and while it has resource
> present then it should pass the present resources to Trustzone(TZ) so that
> it could authenticate the present resources and append dynamic resource
> to return in output_rt argument along with authenticated resources.
> 
> Extend parse_fw callback to include SMC call to get resources from
> Trustzone and to leverage resource table parsing and mapping and
> unmapping code from the remoteproc framework.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
