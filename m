Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D43A3816
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231111; cv=none; b=E4bBaC3Yb2qxgyzSWavEP4IXfIiVZgAfsM3nGlhadEVG4GbllzWuxD+9BirGJvj3drsKSYVzKwehdYg4xudlA2R/UZzYLtF9yJcp8zmg3Yejedy8HVXkNc+PZ0W1yAYtJ2m13J+/Hns9lOCQI5rPxMI07sSW3qlDgyNjzfG6PNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231111; c=relaxed/simple;
	bh=/obxe1Vb7NFTaioTc0WNXa5Lkv4qFvuJ2105wMCse8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRPQceTnHsq3h18BCBJ7kMY6IlW0uDcFkrw3QWP1CwccKPeipGiQiK3X4m6bHX/QkR1OZFp9lDwUDe9s/I16F0CkAhZcuNi5utj8cD25xj+nSJx8ck/4RUM0QHmJBScTCyKz7VWBy/D2MTNJ3pCdbwUDikjcjgetOenEoPveAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XB2gS5sT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwTjZj7n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XB2gS5sT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwTjZj7n"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82F0i2480199
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x1Z67kqGGzp/351X1MKH582E
	OuE2QOqRdpP9R/VwDZc=; b=XB2gS5sTrNvwZxI4lCixwjKTHncOUw14DfqU7qpt
	JbrWatVN3FPNOLbquOjVSPIy5WZTtW6NeOHVopjOtMU9r6heI/SIQ5Ld4fZUgtYx
	NWy/L1yeGp/hinJejoW6KaIGqBl7pcJI4FnnX1unmRn/RuL95r+zuakGnkkF5Pom
	dZGvsdUoAqCJGBdT5aa2d/Hgq9Hd4p9jfeZRynzG/w5FkwYRyRuGHPVAQRY/qxAt
	nf8L7kPXHoM3ZEo+ItlaPerdrOzKTxzOFGjnMtV7F5+rRzT8AkwB6oRrgNtZn4wG
	J4QhFJYOnPuvurdxCZuMP9bsK9/Crg0NxSt7vPhoQLFiAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy1182f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 09:31:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc5faecf01so79959225ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 02:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231109; x=1785835909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1Z67kqGGzp/351X1MKH582EOuE2QOqRdpP9R/VwDZc=;
        b=bwTjZj7nU1Mh45XMyQfovOhT6ey+a0Q+J90ifjFpi2iNtUtvHD4avOG5wLx9RClR4M
         Id0/Cke1vH0MzYv+IlN04V5OUWKNYGyQ0roTz1yCXvxILjJmd2y322dWdBXBwIGrbxHV
         4DrpWyiWTBDZKOUrV7/dav6CLEoJRHgBpht8zfB5axkCyDqUaYyKYzRPlX3Dhp/TyfxN
         FC9xv8DdGH4C2yISnIO55KuC53lqxN+LLj/ZfcTfmQX5ivSoju+kCxDXr+URRYrMPVJ6
         OH4gaqrjzrqAsaxRpXE+mEo3pqv6gH56FcuKKOTVjkcSz6bqa/KP5L+UevZ/hQnxvXm3
         sq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231109; x=1785835909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1Z67kqGGzp/351X1MKH582EOuE2QOqRdpP9R/VwDZc=;
        b=KW66N1gTGl+M/k1GzzBbEqdD0JHsGwQiE1+bKu26zChkUL0srtYczd4wcpjuR0MG96
         s17xCG+tExe0KaaLGyI5n4J6z+fRpZ6Xx5fn8mo2aK196mhe1g/RGop5XyfF60a1fOhC
         YoBF5ppVaXJZtp8BxIdVcwVjDQM5/wbjihViLTEsPWLM3a4t4dlxGozQvo5gXUbTaN12
         j3ElEgXKJUS39QwgaBavk9j8tF7C/Mzrxa+PzgGnV7hdyShNJZn/tKWKpJObsfnshsN4
         qLqlQEqNGtkJ/TvAnNaTQAA2/O5fVX5S8n3iQLD6sMSnHn6heHVqeUy7xL3Q8IP1op8Z
         QgRw==
X-Forwarded-Encrypted: i=1; AHgh+RrZMA2C4x82/mzBHvKfpuwpxLKrrnbPtTb6OGhZ8qUpqovBwYr7jmkdNoGUM7c3bIaflVzk73okzxxKObFvog/K@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9JOZRxpOTeXVdLyPY62XB0PbqgwRtycPB3CB7kWYIMIEzMTS
	N6l7ZZhdmPnKYvqRQgoTK9uSCH2kxC8211lqll4WMuke87dwtQQ4azgGv/yiSXBLkFkarwr+WYY
	nZIjzK4ik23Puxlfa4kwX6vJSOnOrKXXE35yrSw2k/q8kLZmRjIDKOvl/uxg44mje8MgqFxa1
X-Gm-Gg: AR+sD13PEs5kz0R+hZOwbORlWsTpG7hPWrf9IYU5PXFxHKApWugjMn5TE8B0bn670eb
	hTAVKEnpfgz3ljEZy35potZ3CNka2+R22qN4mL0Rg/jJtb4uGmzMqUVRSQAuky4RXjZPETaZEit
	57mCO7rhSu3zt1gL+azd7jhoTdE7S6iPnjKyPJM2vtKrQsRFbFHdeOyH/7viIEBfZH9uMH/w05a
	aCJF8yh4ofaG1LFRlD7O4l9c362FHzyw+itcJ9EazJjsNYazCQlqp4LTiGO53yxBjRKszMYusq8
	FlpmKcjsuMsdZUEw2nPZWurlIPvPINRApJhtN/aVtfdJLhq7wQA6F+ZzZovH+IzJ49g18whMSyn
	3uMGuJD7faOqkegLK9G53suraVMRpdglFtaLRUeljCDw=
X-Received: by 2002:a17:903:390c:b0:2cc:df15:91de with SMTP id d9443c01a7336-2d015db9a6cmr18856775ad.42.1785231109203;
        Tue, 28 Jul 2026 02:31:49 -0700 (PDT)
X-Received: by 2002:a17:903:390c:b0:2cc:df15:91de with SMTP id d9443c01a7336-2d015db9a6cmr18856465ad.42.1785231108765;
        Tue, 28 Jul 2026 02:31:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm48841915ad.39.2026.07.28.02.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:31:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Message-ID: <amh2_i8Z-_gn6tdB@QCOM-aGQu4IUr3Y>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
 <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
X-Proofpoint-GUID: PXnDEPJysMpvY9KQRbGaRXGJTNc5sSF0
X-Proofpoint-ORIG-GUID: PXnDEPJysMpvY9KQRbGaRXGJTNc5sSF0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfXyrXMywQF7U/C
 lr+D/hY5xKgzRlRSQ1AQ7LIBuiKZM3cWy58y5uGmwJGLujNconE/+fEeZXtZsuKaJVhXGAJycQI
 YeIN9V5U7T24JzpINmiAmG0q2Tpg3pdB5YWlkFTG+yV3NEwlxndlngBL7E0JHXYA9kobdg7H0r0
 FlNValh4hrfNU1CC0efw8Q3lMyb7vPUZf9Cz30mG1/oiiKULPFGer75F3A+FA5NpqqFGxj0/+Ml
 RfUcF8HK/zbIzj3gr4ChmHSN4EkMpqaK8Vqp8ZXYE9iMcc08UHPT1fcfNFlr9nOtvvnf6vEUKOG
 +qzImleRk1nPmXj+GIF6s2weLJ6Fda13nTMFGz9juUXvml4ifw7V2Cvcc2u8EuXn4kEwmz5zU4u
 JRNjs1FYVyqafmzcgz9skDhi//FXxGt6mkxNRldtRb7Hva4JlkajiZF9okA+dOMdrvpAyO3wSp2
 LryFwq2sXET/TQGddSw==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a687705 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j4koS-U5rW7OSw6DyBUA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfXzRXIVT5NQuV6
 RmGHKS9Md4EbBvmaZLodX0xu/ItVx7Zc5BMc6r2P57pkUj6C2byogxUxn7oPI5XOXECoVu0Bny0
 CmBYe/llzmSdM5fMRPPPT6jOJJmdi0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On Tue, Jul 28, 2026 at 11:19:56AM +0200, Konrad Dybcio wrote:
> On 7/28/26 10:40 AM, Shawn Guo wrote:
> > Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> > is pre-booted by XBL before Linux starts, so set early_boot flag for
> > attach path rather than a cold boot sequence.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> > +static const struct qcom_pas_data nord_adsp_resource = {
> > +	.crash_reason_smem = 423,
> > +	.firmware_name = "adsp.mdt",
> 
> Please use .mbn everywhere

Ah, something copied over. Will update.

> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Thank you, Konrad!

Shawn
