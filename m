Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D04941B8EE
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751082; cv=none; b=s4dpnnyNHDcOav1BLzVUY/jQreZd6iXtVXAoZWlm8+WfCxZm02GQX+08TuQGkNyWS2OcYu8bQeKQosWf6rUOnYGEMbXZzJtL0uCMiSSw6e17jN9EWm7AWMfP2yYzGbQezZEoM9QE7ceilazAKqJtR87NFwm/cr5erqQGkkHRbfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751082; c=relaxed/simple;
	bh=fdaPCKAt3wQcUSqM0QgVlhzUnC27158ftVMq1DkSTBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjXl9VFqeDHqdmldPLrqd+cRIkURldc8+F3aAy2FnUu48GhfrEU+4CQm/elU1Hmt+oi+z/+u5yi4StbbX4OEAkjEU8KrInm/aVw1zF1BM095j8NdCSLHFgCoRW9uOWCBuijmlSkDQLwxW27umN1ozry4d6IdMH+VGV27Dmm+qM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7o5vFKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCitXS9d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7o5vFKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCitXS9d"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCUFtY948999
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9eTNwTlaNSB9i/d76Sx2Ndi9
	H4zgRZykgqMeSejjZHA=; b=M7o5vFKKjAxGQ9K0jJbauY5hrNX07jlEWQ84WMRl
	umbHE1yIVt+FY6YYs3O9KPx/+pLHRQ5Jx1sPc5ZR98cQjPEMIwjy0mvuh6pcMpd7
	r2ALhEmuNUbbV8ymgPKX7PlIC7SONI9Ucc42lmhAiIbe2CLwBnTJ+ctk392rI9Ne
	Hrs3SAtKkLWq6jVwR63nzdE0yXXCR+HbvsWEs1gbPqQ7Lq1QWP9Amk1OFxG+FNzq
	73xnGOXZp7Av/YwX1sgM9vUHcXNbEiCZVhpItxHcinAv1Saklq0Wo9qF7yxNwqGK
	KI+aHNzPir35XDF2IQn4zIH60ARyVfx1DTORjybO15pWkA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075879v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:31:19 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f3cc4f6604so1621352a34.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751079; x=1788355879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9eTNwTlaNSB9i/d76Sx2Ndi9H4zgRZykgqMeSejjZHA=;
        b=DCitXS9dbekcrayrriX1eWNBdc/U+cOkyH6/mE74Qwsdj/ktJ3JJ5x88NWxhNgP6HB
         b3KpPbQq8yhB2/HmtKrGXxckhQUarrT0JhJt+Hu7irUZhvdCH3Tk5YAvz2cvy3aAiQmC
         bCZEW7UWF18XnI47ofvdNA+esjhbIVGVxjMneckzWssyFNUa4DhCjfr1fb6bK3Y+Zlc+
         SKxFU3eFq5r8lt7wcBYs+ts3rDo2uhzGdO+EKlNs6LfFVRxRcD0AJBb41qTmLM3lNqxo
         MgXi2fENmIW4J7hsCL5huUrZS3HkECzuaejyGyhai3zEAz5D6mqojKSIhM35ic1mGmwj
         UGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751079; x=1788355879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eTNwTlaNSB9i/d76Sx2Ndi9H4zgRZykgqMeSejjZHA=;
        b=TxsSJwE13PL78b1FsPTLmPlntagFczPcmCCL8tL8N+w0Uqx2l1p3RpQzzARXg0uWur
         iACr/cOHMmiHsyHF0//CwrNlx1XNZZQEF+iogxVTkm7FitLsOPvFR+i0B7CQkQb5Zyz9
         V5c5hMtuZM90snMgOadsoMYlMhDprXR9UQwLLaaI+f+kNKMfnANo7UhARqBKsWQxk39i
         ptCQTSwtbPT4wRDHS2H7WbIGDpTK9DtPG876op7RBks5OmqCieB/V/nJ6U9pybxM5xSV
         4iZJTY762DHkJbj+LbzrGBoLmbIyDCJvqTD5SX9zyuKLHcRSrC9c4lrUav10A+Cp9yrk
         dujA==
X-Forwarded-Encrypted: i=1; AHgh+RqrdPV7ydPSjaLO9DXIl9AeNmGcGCq0cKSdZqkPDFpR6Pe9pSyiZc2U7OokQWKSOx4o0nBH4Kzx9gjoj36tIIfN@vger.kernel.org
X-Gm-Message-State: AFuF++l8z631FRXYhkX0N6UPyEJ9Y81vQePUB4qteyNnLf+6H/VTEwDZ
	d4gRQ9UAJdQn3tNunzsZpuXeYC5Rz7HHgVdi+D/PKu42TsKHMgaIszag+fuDbZUZRi6a3iYXcRF
	6szp6NkUd0zSMq62uWfk7DzrIgWQwfWEsVh1I1FABKmCbF9zScAbgu+FIl1Rf/RTlClU0jgU0
X-Gm-Gg: AR+sD12i9rS7MLAynVFCEvZv/YGLjbQuI0AWzm3i1Wpq2BY+DxwYuRtt9BmrpUduHSb
	vXn5S6b4X0cohos8Nt/VRva4AM7FRCpO0dM3f6pCO/qq9lXgrVBVLMxC2a225gSTDAB3RbPSgjC
	wBQGh9ydtc5ni+/LF0BNWvYQtkHWOmVpavqaSRl+GNxT9NhOGsWFFn6jPb8gK6u/DJf8vGd8J3g
	ivLbB3mw3K30AuUt8c7XM76x3oDez29F45xHVZ0Z10TbNqmaYChtXDQIPDugsi/m1l7fGeTNNxY
	7Gq61NL2SzD94M4ZJVTOUbjhX/BAiMbUyNctCh5pxO0g5z6ro7diWvlrfSv1B6t03yuLHbcBW0e
	I/wtNesmyUnvv3Ov8KOyZdThajIlzjNCm9LjRxyUj3KU=
X-Received: by 2002:a05:6820:c8d:b0:6b1:5637:e10b with SMTP id 006d021491bc7-6b1a035e489mr7181727eaf.7.1787751079273;
        Wed, 26 Aug 2026 06:31:19 -0700 (PDT)
X-Received: by 2002:a05:6820:c8d:b0:6b1:5637:e10b with SMTP id 006d021491bc7-6b1a035e489mr7181616eaf.7.1787751078689;
        Wed, 26 Aug 2026 06:31:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a2501bc1sm1722462eaf.4.2026.08.26.06.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:31:18 -0700 (PDT)
Date: Wed, 26 Aug 2026 21:31:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs
 to NMXC rail
Message-ID: <ao7qnvBaHEGNz0Hs@QCOM-aGQu4IUr3Y>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
 <a986fdf1-4acf-44e9-8abd-46dc6928eb34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a986fdf1-4acf-44e9-8abd-46dc6928eb34@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: n2IZ-Vs53Itlpb7ximo6XCNDNctkqqwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfXzkuBboZeGtwG
 2wNl3BMbwqNFZDzdXZBNKc1kNl+Cz+iNyEpImob5wSBpR+cz2hV3cqVBCTVkJriur4XYY2+T0nO
 Lcq+TBvTcXsTzxHVHJubQkX8zldQGfoy0MGRg9g5RzJoJf+dArXmx5iV5D5p8tdQUzWhjvroxBd
 gtTjQSK27dQKMCF60ylr/jFtUHmPFuxQsWkaKuibb/4VwRzJD9SpUq4FfcO7iOz7R2R5j1Nme2q
 CZcDstD++7CboeZ2+k0s9cKCC7qR1D46HmpRBd6E+t3tixH+BkUzK1EeLHooCBSPpFzLw/JinUB
 yJDZwg9+/J7bzsQHqblOESjut8nseOYFPJ/tsuLzIhzaRHg3I/+s6X98P5YKV7bTCHwgFByDmEu
 zzmJP+QOSHhZNky7Z43ha5SGIu2S4un0QVmo2uZS0SUnSyr2yuzT8YYz6LqYFXKmIwO/ketJqpQ
 /f6JxzhCcFq1sr2x7fQ==
X-Proofpoint-GUID: n2IZ-Vs53Itlpb7ximo6XCNDNctkqqwA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX36r9wDRYkyX4
 8s12ia9AWL5SLXYzqOtloTN8rlHmEo+ARB5qq7gEuQI7ALEaN4WeX42d9WLN24+eUS1p2olFJyW
 Ao1sgXRi5fdSk2zcjzxd5fI9os7qkgE=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8eeaa7 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PG6VhwoxSfHQhqF9RBgA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260112

On Wed, Aug 26, 2026 at 02:52:55PM +0200, Konrad Dybcio wrote:
> On 8/26/26 12:27 PM, Shawn Guo wrote:
> > Nord supplies the CDSP memory rail from a dedicated NMXC RPMh resource
> > instead of the shared MX rail, so the CDSPs have to reference "nmxc"
> > rather than "mx" as their second proxy power domain.
> > 
> > That makes the ADSP and CDSP name lists diverge at the second entry, so a
> > single top-level 'items' list can no longer describe both. Keep only the
> > item count at the top level and move the per-domain descriptions into the
> > respective branches of the existing conditional.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> Is the name of the input not "mx" at the rproc anyway?

Ah, good point! We only need to wire RPMHPD_NMXC up to "mx" in DT.
Thank you for the comment, Konrad!

Shawn
