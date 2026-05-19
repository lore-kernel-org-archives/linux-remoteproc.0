Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116051A682B
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180364; cv=none; b=ag34LHzzImMmyUd07chNhZF6oCsYE+HWRdorE7pfVYUecDuNzY71K+POfxNyU7zG+c2PQaqJRmXa8YVI73KF9zoSBuSi+IHtuN+tfDkTBzhIOSMpvdEiNaj7RuWk9SUM2nnyumpwquqcrhfEzt6kgc3qKDpqcy5yJN0D94YBMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180364; c=relaxed/simple;
	bh=OEl61ww1EIDsUXnfEJLr0MXLhW2s7uCHQdmHmvR1q6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGS+flSElNgbVagpcH2/zVg2EQWDctft7y6z+D2DTLn5MRRk3+R/OP4HIC2jbD+Z1DlVn/wsaELo/Z2MbYbIbkx5iqwvI424rLTbqSfZsIrFpyQhxKanbTQ+iFce40n4dS3GSwvPYmz7q6WQ0a0MsDF689D3hAMVschokWXOeVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8gZLpc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZgjSke9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8gZLpc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZgjSke9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8HxFX1146715
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 08:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=szcEXKpDrn/zTAbhtKTmLyoC
	PTVBT+h8OXGfNym8y88=; b=B8gZLpc1F611FgikQyyw0BWfaHYaPo66KRLdeW1a
	h83QEn9smzTZ1myJ5KAyCPlCcGetqowT0AvEn+mGMqFrxlpmMX8EOfBZG/3ZQtkk
	XsLn9QvuMHrfn5adKdNWjwuq/3oKC4Dza0+69Toy/rs39HlNLV3LWai8Z89g7wYj
	nyjwOFLgZJwo3+vcqDxRo2gxGHbqBcxBrJVgN+UAxsWJntf1Ysl+LGmGX6km1LxQ
	I/I0Ohz1rv7rKco+40poDUiPYlH/4FKxfYR+t+hIqyo9jWh1qso0+TZLSQ+WEaf7
	j+5uwnwht20+y8X/krX5Xpa7YaIJxYBfxQl8KGG4bla47g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ehj8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 08:46:02 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13509e2e47bso4392464c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180361; x=1779785161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=szcEXKpDrn/zTAbhtKTmLyoCPTVBT+h8OXGfNym8y88=;
        b=TZgjSke9cE+qGkTXgnosQcF0ySP3yFyLHKvaVwSqqbtulqy8eNWwJR+6V7K2UHmPq1
         LmEJSeFfZjPF9SI0BKqBMG/Rns17VfAjqgG0fbksr/Gt7v/THzQw6lY7l8XDaWYq+oaB
         5havvvxtw8J/BzmoABpAh8tK1cHHw2CloiVndUMiB1Eny6LRDBeBZOwktaA12BUrJkdp
         mMBvH29+y+odLmz6rQzf4Tgm2j/ySgT9tsX16l2CEiC7s7z/0UjvPfdaEmZuvlDwqPhM
         yRtd0t2kPqztLgfU84r7uWbQ1zqkwXXJH7Kw3jG7QJ1ct6eGDdsy8fIvqt0Joajxyg16
         rIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180361; x=1779785161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szcEXKpDrn/zTAbhtKTmLyoCPTVBT+h8OXGfNym8y88=;
        b=R1kWsUecHosfRynjDXUVomgJ75tYInUfA/JFomch1ZBmeGoPzh6CEMhiBvVzutmjF0
         STSAj0mwfo+qH9nwGdS8wzAKsR6nkJosHnFL0FUe8ni3sitw9IzKpbCGpMKd2oYto9QV
         zS9yR0zh8e9KNV7tLVjxVK1BuwIiOpUsam8gNF9vQK75aV2wo+K4JR/HHHdem/KcVPWe
         EwtwPgamjbqU7a5OqfjTTMlrPM+MAxI+RteNfPB0la9ipBSS2t8FWLSJi87WpBJJBUNf
         mpsmxppFO7KL/wPTexfzhwQPOEY5i+hr63Z6ZQjLI7ed6nUVkLOMmCT3ANnK+4KL1G5Z
         avBA==
X-Forwarded-Encrypted: i=1; AFNElJ/B5uQYMGAfFxvZfFmI6L9xxvRGOBYRg9oMOsKa7PX2uCWkvnJJ/lwoKd0EQtUWjXjjm22JyBixhj2F6ryku2IY@vger.kernel.org
X-Gm-Message-State: AOJu0YxNrMLCtvZPTMWzlsyDC9ZEfs+chaLOz4ayM5/sKyB8SuDUXzWE
	H46T13C2+ZsK3usoz/cV8w9aFQ3sB7Znqb+bSPT75mbG8d8MTrIjTWOemgH3imrUKK1f2KAs2hw
	BKBbRURJPp/JupeY4upQb9+2oLvmHtGKSvuKsZka0x+VenRTvmpIHya+ijHK+4HIRhmMjbDBO
X-Gm-Gg: Acq92OErgzdKyuEmrUfCzRtz1fTpkhRzpsMdNk0QTS+xY5Fk6RXsDgr57hWaT/CVcfL
	BAjNsUYTVcXHi7hah7m8m86L3wvvYG/O+/vTONZY9e/TNmxevz6OLGnboH/u6nktqF6A+htMexe
	wAQuQVSYNKJkoOc5LeGQZF+WmuPvtTMFZ2Tsa/QMAnlL8S0Oa6TmxYKDViUnfCebUDbDK2GH4Hs
	k/70GbjsNN9PKRxlxyE6tLvlMKJhtcrboQsgs88QSKKjcQTj0rcykZ3Q58j+gieaRIzgbzeG8oB
	laZJG44djAvG6Qr1XNhFZzwETCc/eBwhfbjS/7SSKugp/hUizBh+k2cVAMYr1L6rdj1ja+Dv0qd
	d5MJmkxnjnf8LFMCE7lO/bbBXdFTI7hQ0mleQnAMhHVbYNNPSNXYPybV+S5qLR78d
X-Received: by 2002:a05:7022:220f:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-13505434ad5mr6710295c88.24.1779180361534;
        Tue, 19 May 2026 01:46:01 -0700 (PDT)
X-Received: by 2002:a05:7022:220f:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-13505434ad5mr6710270c88.24.1779180360866;
        Tue, 19 May 2026 01:46:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ed3sm22526606c88.1.2026.05.19.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:46:00 -0700 (PDT)
Date: Tue, 19 May 2026 16:45:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <agwjP2YNVeVtcYB3@QCOM-aGQu4IUr3Y>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c234a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4OVIVKNPbq5Oz00rPZ8A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 20fYsqT5oGccR6Ve-7QOsSjsHkpAMmHH
X-Proofpoint-GUID: 20fYsqT5oGccR6Ve-7QOsSjsHkpAMmHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NSBTYWx0ZWRfX5fi6gJk8e7xC
 N5jcyelog4MkhRKftkx2YHgsRVoA/Syy+xa936f9PNUyLflFmIdRz/Uq/Xx+AXfEM2haCVcEiy/
 ctAm9Th7hzNE5fgfjpAFV/RSTbXhNrCMTEyw9+UNTW69uqIELYbISAOE2Lzjok3sThF/e4jE/4T
 MToESYdEy4jyPJUcDTFujVMrzg1GwRVIzQEf9XDXPeplLJF2grqhxGlSj9IT0QYQP52KmjVpdXd
 J8SP0GN0rCvzJwCX6CYWNwRr3FBlPUjWpWT47mSVK8YpSgGodyIGbWj0ZmQG732kuFsH4PGzvN7
 vJ4H+ItmNM3J6MkmuuO4dh1qKRf6c6nsHqX/OL5rAjJjI5QppajvL35fGGuLGUO04qym1SnX0w8
 /sJ8N6MUEjxi3L2skbY1koJ6TeueN8b3RNA4Yz1EiYXWsvddsblJAgQZuvDfro/UZC28TEwawoT
 uyjgZnvPZiFO/r7rJBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190085

On Tue, May 19, 2026 at 12:24:21AM -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
> and add maxItems constraints for SMEM properties in the documents
> that reference to pas-common.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   8 ++
>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,milos-pas.yaml        |   8 ++
>  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
>  .../bindings/remoteproc/qcom,qcs404-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   8 ++
>  .../bindings/remoteproc/qcom,sc7180-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   8 ++
>  .../bindings/remoteproc/qcom,sdx55-pas.yaml        |   8 ++
>  .../bindings/remoteproc/qcom,sm6115-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm6350-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm6375-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm8150-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   8 ++
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   8 ++
>  15 files changed, 263 insertions(+), 1 deletion(-)
...
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index dc5a9981c12c..e81ef400555a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -46,13 +46,17 @@ properties:
>    qcom,smem-states:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: States used by the AP to signal the Hexagon core
> +    minItems: 1
>      items:
> -      - description: Stop the modem
> +      - description: Stop the remoteproc
> +      - description: ping the remoteproc

Just a heads-up for Bjorn, this will have a conflict with Rob's phandle-array
change[1] on linux-next.

Shawn

[1] https://lore.kernel.org/all/20260507201749.2605365-1-robh@kernel.org/

>  
>    qcom,smem-state-names:
>      description: The names of the state bits used for SMP2P output
> +    minItems: 1
>      items:
>        - const: stop
> +      - const: ping
>  
>    smd-edge:
>      $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
