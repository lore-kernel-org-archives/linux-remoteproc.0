Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326DC35202D;
	Fri, 31 Jul 2026 03:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468404; cv=none; b=j6s8EgHaCzwcOklceB+Xa+7X4YWM2uIv8ft7/yZ3qwFlTT6TJ/Uqqg4WZQjCA1MfV2XMTTPLdoqN61DVEcfJjB3jHI+qRIH8coyD47xjOb42Do20HH00im2V4zxO6Wv3MMBrItx5MlYEVjmIXHrU/337i2iDfQbnRTLmTUl7WtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468404; c=relaxed/simple;
	bh=ljTVS0tVivAz6stSq3L5loRQidPQMK+qDyLj1djZQ5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQy9/RWd/qY6vRbrRnYPzXoSSujhDUvHosRt67NMqxiB5oaF0nMlkzOPQtkY8pYbkjoiKAHIM5g90QVenDIhcVT2pX3srPLKkWp5V/LJcSIAFGU3/VZiwVsBHWf1YQTCOTnUsIimBPZHmywcnqLgt4xfcETT8KOIzIL9fxdWpNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLwpB/nL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLwpB/nL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FF31F00A3A;
	Fri, 31 Jul 2026 03:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468402;
	bh=EkEioAf+CPWgTnjZHC9TZHWSsOMOqMg9Qd0/TFAvb54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BLwpB/nLH/7y1a+YZaQgy6zs1hFy2ysHadQjmuHFMKi5ucavZYjMubzwFn52nl+Hs
	 ZbHJVRWdWTlJqwhwBQVe8ovV5aP9+YrhLbK859cQ5G02k0jFmTFY2ccoZcvJyL00Wv
	 CPJU0T9KXn5qIHe9YkYXYRnRw2I2k1jH/6LxhziwHV2GPBs5hPNrvyQPRHFSRuV6O1
	 t2SIdYqPkUwveEx1CCLfbBVHrcHJR5UB4FCyZmVq7HEL6GsPhkCT8IllBAvWAMUTjo
	 O/N0ewrWeBY1VwvcPkuGe07vmoA3CvZA2SxGy9djgbBYbYzKA9dE2coNcnNXQFKKpZ
	 JrTNlxZGWoEEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS compatible
Date: Thu, 30 Jul 2026 22:26:34 -0500
Message-ID: <178546838834.317434.17458132438871669858.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
References: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jul 2026 15:02:37 +0530, Mukesh Ojha wrote:
> Document compatible string for the MPSS Peripheral Authentication
> Service on the Hawi and Maili SoCs. The Hawi and Maili MPSS is
> compatible with the SM8650 MPSS (six interrupts, CX and MSS power
> domains, memory region).
> 
> 

Applied, thanks!

[1/1] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS compatible
      commit: 77a6aafb404dda8ed6c2689dd78e10377ccebb4d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
