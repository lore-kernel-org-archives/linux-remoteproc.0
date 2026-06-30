Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4781408617
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822395; cv=none; b=olx0rqAZZXRygsrzC3ALO5CEUWI5neS96KzpH5vIvAYCSmLdG0jjc02dMQTqm0wKtjS4HncGZY7hQKTcMfozsluCYmRbW/Mp6EJ8dYxNJRTEQPPyvPlPeSB6zEVq8zl59IrB5nFzdKauH2Zhby1CRQKuscy5dvg8piHhM+zMBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822395; c=relaxed/simple;
	bh=NoqTc953wGUfCirDeH3SqH5nOnq9U+JWJtIMrbyMGAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJnhy/KcYgdOz+RhIR3t/FrpGFtzxNrGZo0/bM6bZTzd65eEEvJLDvpSh2SgBl/1xA9zkVJAtMo+JpM93VBaATZrKPCVOf+rDdYOJ7XOWwi5M/qVOlXgbJ2AOitLnS8aDOHevnDCRDoRIr514dDYECPYBDeO3r0xJXd3cdBD/e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEQp0xcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7VKq9mj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEQp0xcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7VKq9mj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnC01602558
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=; b=kEQp0xcloYmwQX4c
	kvEzpYrN1l5EVudiD7/Ekt1BdyifNskaaBNsuAayUDPXO09VfiZH3G9rkoNG/8nF
	W4/BwOAxCCgx3DbwpAchJG4MMTgpLsVPEbFPIPRLs2Cd0Rnf6XipGK9EutlPEc6V
	JIHMdAD8LSjmwjJfDtDtObrtEv2erqSfEgSdt0e7alfCGwS+PKE35UXxWJRKTloH
	pPJCM0IvNj4byRf/eUq5bFvN9q4FlvKbOO7lvX2ExBviaM+TU1onx7PIrbIURsdZ
	8/7ws8eoOAKm+tTQvmWPQoxGjl8N+jV0zu4N7hNqI8EQbch0h2TQuauam303UYl5
	ZjQcig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprv6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:26:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6415f279so17237185a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822391; x=1783427191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=;
        b=O7VKq9mjwAbhh8yxUfTxeJ8m/w+t22DsNy6X5A0luIr2gpm8nu70e+BNsur5RBMKj/
         C/r6rTTNqAzGRGwvzkpwDU8okBqFWnySSNUnxO+VG46iqPNxl1olhxzm7T66NR4gVo4A
         KoTprlHcIRggnTTEHkeStrUkSGKAGUxCtGdnAvB+1QbowB5/9Kb6OVNK41DzNFcRqVQ4
         cBmEMvXic1fKYoFEJnGDYnpbO0aAW5ggBqK6l/WqcTgyv/uLLru1F+VLvPyv90lA0LOw
         N7BA9KGZ7u8dgJLUiRsxy1HC5I3aBin1XGN2BJrGu4LHPtJxwDlzh2EcMaLrx7wq5PMe
         r9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822391; x=1783427191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=;
        b=eO/RwFQp4EGAlFj4de17zAzvtv+UBwpbZZyHudvAVRkk51wQub8L0bOQ6TXuL9UgC6
         WJufSQdZ6S/jlkPm0jU7csYor39ekporizCJ0KhMExAFIQKDXFgt8/ykSMxKDu0VaNpP
         yv//MljApMtEeRL1ziBMm+8EGeX1EvGTVASanNOP2oDGGwPsG1Y5OkShH4bvEm50wPgF
         T5jYmDg9b+NtG3vYky9QPjINE7SresMoQ8puplZzCZQHxZff5dPoDTb5HGAbAbJ3iROL
         ds/08JWAzo0G1n2o07K7twOso+2TKshQ1S4q/rOWPYu8AYEpBw3hPap0jXMMXvzo/tMv
         wpKA==
X-Forwarded-Encrypted: i=1; AFNElJ/QY7TLphZDU+YovvUDB5r2nOOKPe0miTXoUkeJI8gyYB9MlwuTImEf/NN9hTBEKIIS5LU014/MbZw4MKWRuCL2@vger.kernel.org
X-Gm-Message-State: AOJu0YzDtlElVeRj2FHyOLn+TrMVRWjGUfITP+j+Wy3oZfTXGNMMBweW
	7w65HBeqB9gTI2Dd6BqtTu18Uwgb2Iut3YxE4ChE0Wc7VTtiVLfMjUUcvxMSUwpx74PjtUAiOZb
	Dv02CY0khZLvR7H+daJyrlxEg96PKsQAJfe7CcZfjBnVuiaQdPigUKZV4aTGY4rAC3eJW6rM9
X-Gm-Gg: AfdE7clf+T7eXRKSjALITldhjk5hNmmztXUJgFx8NGxdtgHpyGxExiBFGX95LAtkVtg
	KyikxM96hAC8gBGD3dkaYFXIr6h+k3uN5C2Xkgh5THZTjvBh64OhmXukJ+L3XtxMnIOKHvgEhIT
	QsywhnDGxYakpi9btRt2ZtUe/smJODsKj2MTz5i8fxZV4qGalAJXmiLwctegFqNKo9BZj4d6R6M
	hJCe0EUmM/n4iIm3QLckQQcut7bt297laI6rp/DJDF5DwqB8ksyk5Z5wJMLE9fpIWoiacTrCFqn
	0dIHoJfF4edZJh3bEtMPLd79+riHdTDZcGzBX2GIubaybxK1Nm1Gg+BY2qEyy9gk/rs6D3WoEPK
	mNBbfoVqe/xbuoZLLAzScxH0aTMeJuXT8F5M=
X-Received: by 2002:a05:620a:6018:b0:920:798b:e290 with SMTP id af79cd13be357-92e62873bb7mr367986385a.7.1782822391300;
        Tue, 30 Jun 2026 05:26:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:920:798b:e290 with SMTP id af79cd13be357-92e62873bb7mr367979785a.7.1782822390742;
        Tue, 30 Jun 2026 05:26:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm116380066b.51.2026.06.30.05.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:26:29 -0700 (PDT)
Message-ID: <e372e66d-7df6-49f2-9530-0c61ad43a18e@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:24 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/14] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UJpZ5rbFa8NWrgIB0_rTERsJFlFA-gqW
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43b5f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TJYwRQMSshrBWr6rMVAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfXwXX2AYXv7SQY
 OIZb1Y0kM0K/LGY7qS6w0aJ5WMQW5KHOa3TE1TKXxq8kwePjKJ+1fSXKFd00QMe5dwQTrr/dPjV
 lOnos9+5RKanN3R7N1GEHtsmdkAaeV968Gien2M1thN5P+ffMX934whPVT7cER1zgu6QYDeQTPn
 rcJCJSR5oOUHxIlgM5eAh5I3wXgnQqQxkgcY1xxfeyT/ezMHZjVr2Wkyv4clwNHp/z6SsR5H5YI
 8MBF+YJBgqP1gW4byUfpiHGnRC3m38KnWRsUVZNPRUDnGWffpuxAn7rFqA59pFTeeLY9V/nDVO8
 kIQ6NBSZX6xCzlquvUIs7zt3fniTGFNzQ2Vb6ktgX8t1Y+RXP2KuB7WdJykRt92dp1QXy65njoC
 qmPS5f6YDPX1eXEw/lBMnj77xrauKUnEEPDB+WxQ/K/G0uxS+PSHmgGSJuoJYf/0pf8USyHC7XT
 uEQFbm2QlwHadInOw6Q==
X-Proofpoint-ORIG-GUID: UJpZ5rbFa8NWrgIB0_rTERsJFlFA-gqW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX/Cw0Xk+IBvJ8
 hWIgGFQ7q8OzJXbjqC6L+qY26Vg1/X2wEuL4u5J3i85DjFjFS3b/NwiqhQpMZZBKUNglDAgeuDR
 FvXhfkGD86w7N4EPTUKq4n41QCqwMF8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300115

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

>  struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  							     u32 pas_id,
>  							     phys_addr_t mem_phys,
>  							     size_t mem_size)
>  {
> -	struct qcom_scm_pas_context *ctx;
> +	struct qcom_pas_context *ctx;
>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -600,11 +569,12 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  	ctx->mem_phys = mem_phys;
>  	ctx->mem_size = mem_size;
>  
> -	return ctx;
> +	return (struct qcom_scm_pas_context *)ctx;

"please don't explode"

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

