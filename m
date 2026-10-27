Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109004;
	b=Fw0brFvMvhOxUmZFRizS5r6aPEhwaRqNM2A7LXIkRakGcobAV9jQvQDcmufPtoOrYVCj
	 R9ZSCBBKxgEWqGJjjFjZ5x3ZAjnWPUoLMRDNcp0xR5ED4ZuIhvBc9KEAefzNdxX/6wT0H
	 UbimNZWV1/YF4K0b3hvdnhlGLIjRN24N704bPK8tdT7Aj71ml0fmPxsMZpcckvZ/0qlEk
	 q+GDcnaGBsfhLOmge4m1Arh3oKoTBlarNMpsX+tllyO/Q/WdSvIEEMQEjkgyu6Wow/qVF
	 DghZMQejjWRUGmM6FkpSYw/PR4S29qCTRtNxsXjkNGqdkm0ye7x1XXn1hPwjqp2JjHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
	b=eViejnY9Wtv7MDopQQdPA0MsBHYm+B2cTj44TcGrM6CuCroG7qNlPCXcuEKnsMC1Ubhp
	 kGPGSTWZ8OzZkZ8y9DPoIQnr9SG4vWfQM9w8pmPFtzjwx9mkUCxWbaj6eX1NWuq6kBEf2
	 ho0G58R/2AwmGXOHGNba5v3bkQYgPOyDBA0HsB1/KSO2qtoV8DWuMYfVPPkqRjP4lgv3M
	 qducE57YkBLWmKUrs+T6PPDJp3vLQFVrCW9ZdccwNjePHDXvP3lazo/jzat+yARqR93ae
	 dLcj4nRI+rh1T9Vr1y/u087uusw1OjQp0vfILNhw0Puxu8O3roqIZpid4V7thjHiWAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDTkuBxG;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE6606A31A
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 13:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDTkuBxG
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e503815adso442765085a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109003; x=1793713803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
        b=gDTkuBxG9wEyZA26EZszhG9Uh/3rX/19W0sqMYQTMrJDaJUmzcVQj8Q5vsjyJxkhrZ
         ej191n5HdezQNZoWYNpWjnSH87R+ugN3VQYeIPp/zC32VuxNyAMnkNWAKDZgLSlOh8WE
         RdAuF+Zg1uwYuVkS8mWy1z80DBLeT2FyCRuFH1gvw0MbLw1U4udivwWLPpPvGFR2Sn7G
         NkXmzdCN/4KlmwzL0WafjR6fS4/vKwQlYLNnxgh5F4QV7qFrZioFlDVVQ2/1mLd/v99A
         vLdxmNi1B8dVQTg+3RTCB2njXv82jd1gXawVzEov8pDFcu7Boxi03mj5uhtfxinaBtPu
         kBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109003; x=1793713803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
        b=R811b8PVn3MMphy1E9wPki25EUxTAx2KeZFMVLm7K9eCYSo4RyX+C2wMG5MWUjZwGk
         GRq9Iykefl0tsMGlVPYpWhlm2rxlb0JCfChUt+hoOmt0BrGyteuhYgh/vgLomEkdKPH4
         mLxA44+Iackk2VzsQWGd0I/RsE2TnmrLDK8ddhH42OzsXgFHp/+/Uj1RnK6jpDQJMN1D
         bCIVF1LXo4mqdzzhb4H+cbA2M1K1Bmp93RiXvAa7hjAxE/8TbLTqIAaan6fx2Iuxd9Xm
         nzcosMpaSqeVV/hfqCPfUSeXzqtULZcdHQVkNgb7o62ysLNTX49am2sWfHF39DzDTPmJ
         Uf2w==
X-Forwarded-Encrypted: i=1; AKwUvBz43KLI5gL32bRihWprrfXnGBOx6YJoUAhjyTAc8IMxhvZVC8OcGsU2Rk2HiN7JHEPymVPmqGpImGO55Lvex0CG@vger.kernel.org
X-Gm-Message-State: AFq9FYKMPOxSFKmMWakJB92c5LBxCK4cwUzjjwnsK10RDYqcURhMtIi6
	Su1g9GUtrH67Y0iUOrQxYrjf0guQJsaA/CzTn8LIGIS1D1B7IGZ55c2w
X-Gm-Gg: AYBFou3Dkh7BOMX898sd/nLkBSQMcykgkE+VH9+PUvyfx5f+8UOsFxAieZmx4B6TEVV
	39O/calEfRW2WItGiVPNfUFQ/rF5oeS15OOEq+sYybbhjWDcU8OYgeVB8Hkcf18CO4eOeNdpH6I
	PmAYkwu9eSqkkiWxJDlHxM/sLt202EwwyRGThNi1fksBm+nHPsqc4Gkw8M8Tsl7fiYusZCviRlr
	NrNT2rF5F16GROAhusbK28J2TScuylCj0EfW8boymvgDx5YQU2kizdNBiL3+WWpOU63hn2XC2mU
	YKrj9I8Lme74RXHarAfd/Oe9B8t3syIgLDcDVi0AfzbT7hpJBzJdaZgrGc1U3+1bynvTxyBx7wD
	ahnpuvA56s3hCdJ/Nmjony5qQF+DCcNigvGtxd+8nMPkpQXSLqcY2eoTjy5XA8HfaBl08Z+Wy8S
	Q7DflQRiqh8TS9zyWivhOJod7A3SmwgEiqtYMINyn1bUlb9gis/hS+QHcxv/wt379GsK2xGbJkq
	b8P3tpn09HXwibOUxtO/O2E8IxlkvGrODfpL0ZiRX7MMOk4KvboQ4tB2w==
X-Received: by 2002:a05:620a:4152:b0:93f:565f:e40 with SMTP id af79cd13be357-940ef98bebbmr1567887685a.65.1793109002941;
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Received: from localhost ([141.117.117.39])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b1adbsm978781885a.4.2026.10.27.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:00 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Message-ID: <auCsCPL7gK2lIR5q@rdacayan>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
 <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>

On Tue, Oct 20, 2026 at 12:37:36AM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
> > The Audio DSP (Digital Signal Processor) is responsible for audio and
> > sensors on SDM670. Add this, along with the SMP2P nodes used to
> > communicate with it.
> > 
> > The sleep state is included to prevent the following crash:
> > 
> >     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> > 
> > Otherwise, it is unused.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
> >  1 file changed, 168 insertions(+)
> > 
> > @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
> >  			#freq-domain-cells = <1>;
> >  		};
> >  
> > +		adsp_pas: remoteproc@62400000 {
> > +			compatible = "qcom,sdm670-adsp-pas";
> 
> Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
> fallback here? Then you can drop a driver part.

Actually, looking at downstream, this should use the LCX power domain.
Can power domains be omitted like on SDM845, or is LCX important enough?
