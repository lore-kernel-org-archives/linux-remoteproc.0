Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DEB265620;
	Thu, 11 Jun 2026 01:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142475; cv=none; b=DZHmkgFqN7UqaMaHKdb27/E80b1uAiLfQeQJtJG7TnCsR366IVl//f4XA0RyR6UMQnYeE1KswRE0Fwl/ZOt9wjayalVOAbotcrYyt75wJzjL541IfMnZym1JaTqSEQR165YAwHaPRmTRGNMOE4tZ/15r5rn15aGkRxo2NDJlT+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142475; c=relaxed/simple;
	bh=GuQJgjKfeC8lE+5MU+T/2VjLycXSLPbj6ZOkqgaU8N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMzi9Fq9+eqvMQGLg9QH5PK89ABZIDGHrBCot1pJDc8mW4R3gm+y/CnI2L1i6nF6ITR14buyELLLVH5N+Frv7EDEU9WcY1qFE2OBtgLiFy/yA9nOgcIHD9sAwz5+SwI6kGsBQtZ7TNrenjIpuQkWJQz2k/liSiQOBLPLtUJPyJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUNBz3PY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUNBz3PY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89B21F00893;
	Thu, 11 Jun 2026 01:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142474;
	bh=QgI9TH0K9M08zgUhlImJ1Lz1hSkKFM10JZT6HcfOXRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eUNBz3PYM95OA5i57LYharcxwl9QvD3LG2sAhswZ+wx3oosYOKkThi0jxo5NG+H8O
	 r6NqpL6j+uLFDn05TNmvoUxlWnhQyCRgvJqTwKq5GVNs/0xaKCNqpJcSEIlfHn4f3y
	 dFEH5x0XQZO0MRWVZfbW6kcxMugToygTA0K7P/8WxDCzSRPXW68n65tjXYTQcI8ZsK
	 nqJvhVG10CoHwEuWpXIkS4mTEfxlspuQql9dN+uSGkSAGfX/gRHsxAhNYveZcyltF1
	 WLNAjj9hYOuplsZmVcvnNK8Xkpahqwo3lZwasfQBNl89KPXEmnzWh8ALXACvwzTPeu
	 U4w1apG7nZMzw==
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
Subject: Re: (subset) [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi ADSP compatible
Date: Wed, 10 Jun 2026 20:47:43 -0500
Message-ID: <178114245711.590736.10294919878949624614.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Apr 2026 00:36:13 +0530, Mukesh Ojha wrote:
> Document compatible string for the ADSP Peripheral Authentication
> Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
> ADSP PAS and can fallback to SM8550 except for the one additional
> interrupt ("shutdown-ack").
> 
> 

Applied, thanks!

[2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi CDSP compatible
      commit: a9697e35887e7e3dc1135dd97efd39d46d910e73

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
