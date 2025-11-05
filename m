Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AC39FCE
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762304416; cv=none; b=G7F5JRrEPbfZmYP+Jlsql2LlW02xDf3Am2IRITRFvzMga2B0gZJn5r/4jbH+5beiLJKoYagFfhkSAbcryiVJODbGKxd9OezqbZuIx33ge9uNo7KZVmujohizsM2v0SGf88bolbWoDcjBnxuRWmcWXH8EOpa6rClaygligCuO7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762304416; c=relaxed/simple;
	bh=tgepo4GyQ802eDd4JshSs8ce0W84dBIvvbNERCTaaRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieEr2kPOG44dE/fQsR8nRD7OrMTgvozCHsv7nYfo2O0SVB8WTWRl706tHW+PcLvLdiO7/6uIpwzW9Qi4vD/zg+LS0n8MeRXVybFempPPhEfmnTMTtT4xBSVcJ6qDfKUoOKWmMrgMbIzdq/1ylSA9sKyic9j2Mfo/c9ZE0LAusug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGoVardh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTrp2EIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGoVardh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTrp2EIF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Kg35x2968515
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Nov 2025 01:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AIXwpv35/cEoHD08K6XXK7Yl
	+Ig/mTbB/PkIxymEVQ4=; b=iGoVardh78cSgkPJ5FWpGXPDrqObIvo/ZaDR8CXQ
	NFi4Ruh5GwNqNAcZAEzFUGMtyxMFl4COhEFaC9G/Nj+wEHCkyiQjfy9Bmlin49hJ
	ygdb+BpSF34Oz4oI1dk2WwXwFxhJwjD/Mq6vDOBCY+nS0VZ7U6/oSllIcNLJqAfx
	9VSMd5TkrstRDqnvmsx9di4j75B/OCHwqz2aOB29BW+TkypqbreGwmXexqRWUoOm
	g9pGQprXsIkVlTVoE7q2wrd3XvqofqXcpV9fb9BY44R+CF8iazRWX53RIE4MgTJm
	BcjoYcqj/MpQxmzLNmgfbF5Poc04+6Ra69O3bKqmJxbrvQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heaj3fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 01:00:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so33179801cf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 17:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762304413; x=1762909213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AIXwpv35/cEoHD08K6XXK7Yl+Ig/mTbB/PkIxymEVQ4=;
        b=YTrp2EIF3ozvuT4scs1yKNH4JEdp1gOj/Jil62NIkjGD0qCDIxCwOCe2EjCX2bAD2t
         R+p6EcKVgueVsBKyQKsEwsAvuCYRZqR37K71MmVFyqbR+Zhy2xBZqF2PmNDCwX41UCZj
         HCgIOefN+KjRseJVx2FdGQX7L8weBC85MNLnkxzx5/wPtpSmIYpR6NuM5FLynmY/Rp3y
         gIuyybdU1oZ3GHImsjEkPiSlFt05GMpcoKbOVlTLhv4eY4zeA4bkjI/LNn7YBHD0xJZ5
         INOoPHZYfPYjJ12sSOcA/IrUAs5JuTbYYn8Foljl1ll2ZET63wyqCCkDPg8DcdUNUmL0
         ymaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762304413; x=1762909213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIXwpv35/cEoHD08K6XXK7Yl+Ig/mTbB/PkIxymEVQ4=;
        b=vRoR0Z4WKSWWpJOYxIRMqA/4FSAjopfemXgiLvheBI9PDvJowrgm3NGJ715Pz3/MS4
         3OTbgx5yzhU7IO/bHP22F6fH40ipAlVpxY/jXIAULk3tm+h6ij0y5DhPbPP5mLeMhtNp
         SdP0kDAU385zxXJqSL5/PCe02LBKsJ05G4n4JAOXeRcvyt1b6taRG1K31ZzePVRDedLC
         8SJQ0ji4hO2vTGLzgnqbh+Tdh/gzW4UTLqc5EIEhSYgnTMq5fOTu+3TpV4W1QAHHLdBS
         02onoVpUPP3iE9DXuuIa1MkRn0K6iT5kkfqauqt0heefsNFYgNDsVhvy42y/m7XvajNw
         Vshw==
X-Forwarded-Encrypted: i=1; AJvYcCUGxD/B87WqpUCqc9Uwu4yJbdt37B2BatvtDM7mz6pZQhs2+PfiXOuY2+vK1pI8DTfXUXMnr/VDH5w+vsG6Mxcq@vger.kernel.org
X-Gm-Message-State: AOJu0YwFYYQPXCzq+dAt9sg/n3+DBMYp//F5KeWm1F5XkqluPe7oiwkC
	Hf/W6fGROn7xrJDax0+tIXHUPY6kvwQri2hx1xLokYKDtQ0ltaxQMI1qdXKM68sp7v7apXTHpfm
	OB/ZwekfIYy/cyilFqsiUmCLd74veIZnf1RVncDVRafVwBQ0K1FCOE94xBWQ/TRuMLbh1o1OO
X-Gm-Gg: ASbGncvJJDdArrWd1m0f6HDbWEjQbUuZUEhsKgNLCnDHlHeOC1Q1YwBhSI6+n1nxHtn
	oPB+gzYC0VebrgNd5gk7vYEkorlX5znQeZuUAsdKk8W488MKzAAH44L5gEfCScs/1FpGNMpve4m
	3Fp0tg9ujSt9LCdONq6IJMJYQmhb57ZLKoOcgr8WtgXe6uFiMuN6K39hkYZJeKwb/4aAgYAxOAO
	CS8LudkwuVSoP9PHe7SXuCTvtVgL11BblIp6ovUlSEmjnGv6Zc4eEkJkppSP824q7ujoi7T1OwA
	qWAil5mx79vO3terS8etZcht22eRzNwStYHH7xgI/+l/wpKB+PVk25EKbA+uMHslJs/ixhaWywb
	QYej7p2XZ1xanUXSNW2V/6fbSn5dHDejxra8f0WUdCqjCTVXG3Q+JiKVpxC9vjuAgVKjgcI+rtl
	YZSN10hf3uE8Ua
X-Received: by 2002:ac8:7f56:0:b0:4ed:6574:3a90 with SMTP id d75a77b69052e-4ed725ad94fmr15843891cf.35.1762304412770;
        Tue, 04 Nov 2025 17:00:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqM9wPuzp7mI3UoDQmT6XFIeKLdRKJwOrx52uQwcaZNJaLGlcadS9yQTQb88x9OM5PTiSjZA==
X-Received: by 2002:ac8:7f56:0:b0:4ed:6574:3a90 with SMTP id d75a77b69052e-4ed725ad94fmr15843431cf.35.1762304412075;
        Tue, 04 Nov 2025 17:00:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943445aa08sm1184504e87.107.2025.11.04.17.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 17:00:11 -0800 (PST)
Date: Wed, 5 Nov 2025 03:00:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links
Message-ID: <hq6bgwan5yma3cxl5fcokyglwsvfonvawzzkl35iypxagl2twz@caeainjotpbr>
References: <20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com>
 <20251104-topic-8280_mxc-v1-5-df545af0ef94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-topic-8280_mxc-v1-5-df545af0ef94@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=690aa19e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GkPfKR5kf5ua8B1uwKAA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNiBTYWx0ZWRfX4ju3pT4TiKy5
 w8oFyjLyw/KhQc2VuPBjQpqR+UUr821/VhpAQwLlUwAtmWBOkbK7MmC6RtDGfLnrkWwsgSt2+I3
 jnkcvl2+UqAXMp4XoHnJVzAy4emp0zoHfH270D+PdfofQlYMqmTqFdhtFIlRhIe+pYvJA8wGgkE
 Y1RAR2gaVoG1PsNeAtaCImE/ObxQwm05QhIugS2j6VaC0l0GoazFusgUO/fii8JUtv/DH32WEPA
 iolNKzj23k6FmHyPZVeaJpy5v02rYgAXDzwk4Vwyz/7a0hqstzErV01/9KU4Wu+v06MqyiZ1NFj
 P6TnrFQEFSaTNvuGyqIWluHyALQBn2fF0RGUJdA9W/ohYKFBz5xL8UPmWnjxc4kE66X69W1NzeR
 tvwhBd42Opls9zUtFloqLPGh//cO1g==
X-Proofpoint-GUID: S2XuTxnMzJJRYVpTfntyNv_YiKRbQh7S
X-Proofpoint-ORIG-GUID: S2XuTxnMzJJRYVpTfntyNv_YiKRbQh7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050006

On Tue, Nov 04, 2025 at 08:31:10PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To make sure that power rail is voted for, wire it up to its consumers.
> 
> Fixes: 9bd07f2c558f ("arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp")
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
