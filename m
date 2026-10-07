Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEA03D647C;
	Thu,  8 Oct 2026 07:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443949; cv=none; b=PGLjhscpLhM+VeLDVD5RmmHF+KHXhsipwx426kjsf+yiADbspYkjavQCwnB94NM9lXDtFGelt/R9+swkGwChQJ+0/3NDomVef9g71aHQCqUvx7e0O4OEnEt3TO1UbfcltzrPAUC9iGWGlTfM4NGFCwz8o5YZZudX0pT8gxW246I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443949; c=relaxed/simple;
	bh=/tBnpKW+ZW/Yi016WN0hALcaGKMA+PcAx0Wn9UnTOQU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bwlj4UEau9x52f5OdlF0qqa7l0X10q9bnvhbjzzOSW6tT11y6CEVuTzpRle7JoHvoC/JoD9KOckQnZW8SCWmbiTwdqxfycPdX40oFrjPnjqappaoE5/gvAa87FexYWCKoe9qYP5fGnHOE5CGGSnACgM4dboqTgbOlXjQ6kHDILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oa1tNQpn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oa1tNQpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704E71F000FF;
	Thu,  8 Oct 2026 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443945;
	bh=XHpEnqYsiMknYcRirs4ZAfwjTk2r/VjYbrdH1wT2HWA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=oa1tNQpn7DlFKmMW1BdRdEkSfUIPA43Ar9F4bSdTBiBhp1FGwOUb3UxqJWM0FtGfg
	 vvOfFBJGkhjubuuTp4uZ5vrQ/3TecPta9C8x8chGI90q4D7Toc5JmZrovWFlMq2U3b
	 mqA+/QP5hHMbLxos3MBaBbyPZiIxKCpAm+Xw7c7127rAt504VatAfVOypW9oRXPcWb
	 nIxsU+pB8OLuyYlf4Y6yEyLa5aa0C9GlwuI5YVhTXrD3O9BLaqIebN+4PuZASP2vZW
	 kUOY62q93RNMeunbRi3cngLEIP7KnH5+Z00oQvPZGe5526EHreKyZYuI0empoEDtx/
	 GdW5KRX+8c2HA==
From: Mark Brown <broonie@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, 
 Richard Acayan <mailingradian@gmail.com>
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Subject: Re: (subset) [PATCH v2 00/11] ADSP for SDM670 and sound on Google
 Pixel 3a
Message-Id: <179137115234.2423942.7709943908182530638.b4-ty@b4>
Date: Wed, 07 Oct 2026 13:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/tBnpKW+ZW/Yi016WN0hALcaGKMA+PcAx0Wn9UnTOQU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0PiNRcF/e43VxJAq825svReY/Nmi9zpO23Jl
 vuJyxOMBFuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdD4gAKCRAk1otyXVSH
 0OtrB/9xBNbc4hSKP7nSoUgZ/BqL2RxUPhKO3i6wkrG31XBmZFK6ePrqUnwdsUIEijyNYoT1ryD
 rA5pZtupMsX9pObiGGnnxr9IioY/ANOh5naCOtZGIv9+cxRfXCVIAuUVWqmxRpd/MPCmvxwzg+T
 ZgGWdjpOeH0MzbvjMUu80glJE60APhh3Lpcix913o2S1PveGZ/TE7t6u0nW3ga8q/NMx5yiOAlD
 azKjy8fC0fnJa60lqrPXvtTGuY7N+FUFWQNuI0K2zZxhSg12MIOGfyJ8+MD1Xjmv0Dll/feWjh4
 zVp50NaWLjdchm1Zq30XWiZrfHL63S0JUp1RugZczU9kuPu4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 03 Oct 2026 13:56:48 -0400, Richard Acayan wrote:
> ADSP for SDM670 and sound on Google Pixel 3a
> 
> This series adds a user for the SDM660 sound support code [1]. It also
> adds the ADSP remoteproc for SDM670.
> 
> [1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[05/11] ASoC: dt-bindings: msm8916-digital-codec: Add SDM670 compatible
        https://git.kernel.org/broonie/sound/c/5b81127873ae

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

