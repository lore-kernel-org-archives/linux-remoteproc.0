Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A0E46D0BD
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 17:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358528; cv=none; b=NgztSGi+gTEvXcWW8RVzhstCneF/8acU/k/hWa5p0ZQQY2Rc/78VvQHwoVplMCKps6kDzWyMev3zVjS27C/DMzW6jRnJIoOWRpmSk4RhKwyEh/PWtpFuTMiLuu8wujKEo3zLlSFBWLen48a+TpvnH22ljrzOfpkgUTu45d5SE+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358528; c=relaxed/simple;
	bh=hxV+qvTdQ/L5+QDF7jTM+x6xriCKo8Oss1Iah+M8rgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGGCa/ZsOi4URmt7HQTqvhldFdm9gqvSw9mlEtSXpLzovRNz6WT98vtMuVUQ8xOIMyFDF2L6aTgPKK/aJz2BCU9cbmV60yCjHzNO4pfvLQxP6QtCAgZFytT+1IB5jbf6HtFjuvxcP1GVxMKC2Q0go8eMvf01bnAzErDKfjresDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9b6/SL8; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9b6/SL8"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so178858585a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 10:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790358525; x=1790963325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tqho0gYvfxFyUzakkOYHaCJ1K4YCibf7irTMVk2q1ig=;
        b=C9b6/SL8Hxh8W2XbVAEGfL4p+IlWQ/QGVcyPWsOFRSDfRyiUzmQja9FLZPix2D/Ruj
         6NwGX/Zu/SnuM+T+YN9sJ1fMWpDe7QMD1Yr85w3dllWqBCsQUTBrTChk/3D8NV3OrOJA
         MsTFgtTWTch3gEdu0/cHBB0N9goWx/9Pbw5zuFfkDv7bvngxruwYH3rwJEMc+1zvbUIx
         21H869tRHMBA/k/Rdh0MtpJAyuPAaQZmH3Qrv/zhLOoeGqURsBmvxcqEPnJAnLdWTfew
         2ULWMrpQ7HhKwNI2K1xAjLXLWFCIqTY/AP0oxSimL+Q3boF8vDeekJ6et1wQIrk8rgMe
         Ot0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790358525; x=1790963325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqho0gYvfxFyUzakkOYHaCJ1K4YCibf7irTMVk2q1ig=;
        b=BpbFrhy+r46+b5rU01kiTTSH+tsTyTmmnbXrnSX2Maq/OtPMLweMpNjShEvBEo6VuM
         9CAYvpJzcBJG9UgPmCivcPTeSdUZGaJ3r7U8WTX1Zxn64S9+GJsDFGQFDMsbKuWpOSf1
         ojWZrGGhbSTTUXQDPJFX8g0c92lxDsrDybNfFmZTuYksstLk0uMn7HFzQqHSC2tDpuCG
         +bvaPHD0b1s3wRomlLKOoaKkiQ5fTHVva7T2PTYB1jwSsGqFzd1Rk0CY400pbgG7Ul5c
         WpyycCEwO+EsKjF0T4/AxSTzYWhG6HMqUsn3NccbnlrsRaY299BUZre/wVqeMuhRRSJs
         zdsA==
X-Forwarded-Encrypted: i=1; AKwUvBzrGIr1gXxN/rYsSyNHMXlUa8ZWS6wuVEwNqhg/9aweROD2yGcO2yUQ3dGVV99MPltACaSNZUQ7g0TNCJb2kKyS@vger.kernel.org
X-Gm-Message-State: AFuF++nRg5yPOBSXUA8pCR5btPEn53/Ie+y/YVE4sKq8fHkfN+i8aSLy
	O/TsqQksnDVW1zP6/PZ9qr8c+JkgQhr9BQWqwqc5iShmhbL2FmwAd7mw
X-Gm-Gg: AYBFou25Z0/rf2Xd+YRg6OGP9Qi0TAquk5LqWam5r+YtE0DesEa4K+raTH3NC7EJgxj
	+FN+RW2z+UQgQbGtM4byb6ge+LTnmt2rA70dcOVP4DUcXWTJmPXeqS40uEauTH5+Ju0f69epniz
	uNbg22QGyc3jG/GB2P4I7eLmxJspqcL1nNCWrsIyecckTSxvaiNS/0kO9oI6wakRduYZqJXlBW5
	ykxi/+0RY6g9zGisR8ou/BPi46fGRGGJ74AGbzs2T30nqnF9L7Fc8oapQwBjoq3iCO6ebxk7YBO
	4Lx5owkUPyVYKT7MrLgDVGVmLcvQzGqf2q1wYteyKTSzJBZzaB9jar8GJDQKwLwcJ8nDR3vFibK
	csjSg5GzCn7WE2lEzgTouPNvnqOQEl2kACGzrxv18SbFdSDjnLYR32jlfhZOvOpDruvRZcOaeTc
	ZC/7fPoagjrRtNilm6dZghr/VfyyguI+fksgz6K+nQBbgsO7m7Zakbvi/Rt154m/1LUnkvk+57
X-Received: by 2002:a05:620a:1b8b:b0:939:9bcf:8d35 with SMTP id af79cd13be357-93c43cd2ff3mr580302985a.35.1790358525493;
        Fri, 25 Sep 2026 10:48:45 -0700 (PDT)
Received: from localhost ([2605:8d80:6a24:95:3113:1259:156f:f039])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c4499c06csm232636485a.46.2026.09.25.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:48:44 -0700 (PDT)
Date: Fri, 25 Sep 2026 13:48:35 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sdm670-google: configure analog
 and digital codecs
Message-ID: <araz8_AlFWLV3c3n@rdacayan>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-12-mailingradian@gmail.com>
 <f43ebaea-05c5-40a2-882b-3211e3590476@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f43ebaea-05c5-40a2-882b-3211e3590476@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 12:47:43PM +0200, Konrad Dybcio wrote:
> On 9/22/26 3:58 AM, Richard Acayan wrote:
> > The SDM660 digital and PM660L analog audio codecs control the headphone
> > jack on the Pixel 3a. Configure them for sound playback.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> 
> I think it's better to squash it with patch 10

Maybe it would be better to combine with patch 8 (same /^.*:/ prefix),
if this is just about number of patches. Patch 9 is about as related as
patch 10.

> [...]
> 
> 
> > +		lpi-mi2s-rx-dai-link {
> > +			link-name = "LPI MI2S Playback";
> > +
> > +			cpu {
> > +				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
> > +			};
> > +
> > +			platform {
> > +				sound-dai = <&q6routing>;
> > +			};
> > +
> > +			codec {
> > +				sound-dai = <&pm660l_codec 0>,
> > +					    <&lpass_codec 0>;
> > +			};
> > +		};
> 
> nit: 'co'dec , 'cp'u < 'p'latform

(will be done in v2)
