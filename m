Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A062403135;
	Thu,  2 Jul 2026 23:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035669; cv=none; b=c6F1uOUhhepCpDMb5m+r+wMSP+kHcI+f+gS4Q+c33Yp4IekgLop2FkhjO0FzS5J2u2UJTBl43rhrG50ND0BCLlZjlEOdk4wAjGV1UKyxu5bR1o14QIle9Nh57D7HIy5niwC1YYsXPqfB9UFUJUo6VlMYYLxPRATSLbY9I1c3WkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035669; c=relaxed/simple;
	bh=fjFPVgj7tY8aYPEN1te/sRgssMdYINBeiJkFcM7dq5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQvUnuatAafd51GvjfIlQaWO5R45yvKzWf+EHjxPmw3Y0mVGAS1qA1vrxooiSxP1Xum2GVAh+OyJk+5asguCe61mVbOJ9MdkJv5Q1whk2QoslHVqFaBuGQxyItQFo03Yt5XfRRXEfhmFY/FsY5fpGblEaynnBrITzH7AMAbdtM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UszP4oso; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UszP4oso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37DA1F000E9;
	Thu,  2 Jul 2026 23:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035668;
	bh=kpoHi09OttcFHOh3Ypl+Vw5oCskxjxxKclcv6CQt0u8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UszP4osoLr+icGnp5fvoeRjktaSW8Emoiyzq0AHRFUz4jmHjTmt82boJGVlIGv2GS
	 FP/qZS08G/wKYAishCrwfhto7+yB0gR1l4zZ0qp4bCXm8vx1SltKgqWyJZIGdE4ooH
	 /BALLSQW1FmtXnZjm9jBkK/QFXUsK8shVhqpqFiLif7RJIyUjxAXag3Q3FHbFJyAza
	 b/gQU6ZPUd922AyFvMfsx0rJ9GrhTpQ3LHlOXtPAsD4dJF0utOMmQzUzpEUe/fimMv
	 7CrzyCNQ8BBdnM1rzOR+tvoXtT8Yo26hokg1QqqSd8BXoNtqWX6Ecl6kCIN9Fyn7w4
	 USrwaMfzC4iIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Add compatible strings for RPM and mailbox devices for Shikra
Date: Thu,  2 Jul 2026 18:40:42 -0500
Message-ID: <178303563642.359079.4771352066753905128.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 May 2026 16:10:45 +0530, Sneh Mankad wrote:
> Add support for RPM processor, rpm-smd device and APCS IPC device
> for Shikra by adding appropriate compatibles.
> 
> 

Applied, thanks!

[1/3] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      commit: beb6c1bac2b6e3cc53b1bca918547c8a58be4d3d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
