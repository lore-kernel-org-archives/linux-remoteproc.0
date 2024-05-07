Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1066A15E815;
	Tue,  7 May 2024 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090783; cv=none; b=pM7oh8QnfLfD2qvN8OiLatlJ08MqLXJJmL02MdLnHaIgiw4q+odpCmVWN6sBmwQGA56zatmx7OT0nGAf1ntRN9UnCuWkR2SIuHlBU7Ms/wvrWPGwvc5dl9mpjGy1sEFNhwVrJsRQ90w7jo6+9yHaXD044nxW7sj+gSVzFdyiEhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090783; c=relaxed/simple;
	bh=mUxS+xVheRCFUNrpCPL1kUwdzF+sdIP7qqJMnbRUlpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/u4LvgRJgFlT4smpfLPWHEiV1Efctl787UOLsFsdwQ27ty0IXwyZtd2HeQnkZHGDyN7JbFhbqfakASREYRJr7sTB8Jjhngzpf+zXMvssWQuw3qz2qhIgbzhUcby40jWRB7la/A3jUIPqJF6/4rDqDeVLMoLQIM/8TyTTpQZ2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqwdJnF4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqwdJnF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA2DC2BBFC;
	Tue,  7 May 2024 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715090782;
	bh=mUxS+xVheRCFUNrpCPL1kUwdzF+sdIP7qqJMnbRUlpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZqwdJnF44kKO7WUpinsq2OtXAltpIUK3IHtKpCo6KX858wUcd/lJLwyIcR+Cx5jHN
	 0k3aD2CDYaOOdS4ZHhS6xxospwc2EOTaPMsDvlCo2qhnOkxDCgYYsFhI9Q38bOchoq
	 JuEvCEiw/FdHzrB1MLEmr1DWEiGd7YYqbmU73eJWeneIc0hmvW5qNZwg6zHCMaYsTl
	 Xn/NYaWFlCAW7F60M28f0qeLFQ6l0or2GDLzi090CX0GGn08huXa8cMnhVGyUPiMLu
	 BMgXc/t3J2QuAzVDfznZEJbL/Rv7Dn4QvhEuFcJe37UMAzPMDjsySm1F36CRFMX67T
	 t1U6XEh/tRgrA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: msm8996: enable fastrpc and glink-edge
Date: Tue,  7 May 2024 07:11:20 -0700
Message-ID: <171509107956.2289022.18016615204503656582.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418-msm8996-remoteproc-v2-0-b9ae852bf6bc@linaro.org>
References: <20240418-msm8996-remoteproc-v2-0-b9ae852bf6bc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Apr 2024 09:44:19 +0300, Dmitry Baryshkov wrote:
> Enable the FastRPC and glink-edge nodes on MSM8996 platform. Tested on
> APQ8096 Dragonboard820c.
> 
> 

Applied, thanks!

[1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil: allow glink-edge on msm8996
      commit: a0acdef561d1699b020ab932a0edb556c4829533

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
