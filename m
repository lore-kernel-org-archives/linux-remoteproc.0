Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25538390231
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 02:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784082541; cv=none; b=TmlMOd4P/a4q8qK0Fgil9pexVUJlbDq+gEAf0gNgzJjdrAPuGh3ze08nh3l0gav63nLDYVcqRQzvSdtcVOMz3axa+kPYZvxLEIklGRcUk8ORH/BTcOvhiPb2UdLucqNlpBWEFXb948bGEdzESj7q6yf/xM7tbPOq7N+otL6MzrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784082541; c=relaxed/simple;
	bh=6L/E+zHPBkzyXInpwFnUmel39o3tWspQop5yMbWE4rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEm7ApSNrDas3cRqcwYwWsGXdgO1rwVds5Wmjyx/cMHJjJCPwrhuC/GNhX7Dve97JXMQkoG4SRsbZKkYvabGehTkeAKH3gNFYLbJT6onAD6W1gBKjUULRL/Z0jUMqShtkksI0QS05v5dlrrax90+mJ9Axsge/6fuBKH4KkacNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egWuM8ma; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egWuM8ma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68271F000E9
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2026 02:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784082539;
	bh=1kXcTL8/0Zn1GMktmg0UnKx75NkFUMHQp0ZSVhtetpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=egWuM8max8h35yBWwETK4lVYSrr9hacKPVe35TOiw/mkJU9+2cO8o+0OG29AvHcPu
	 hy+ELlIX3HaBshGFA5P1lYHpcogrP9DqWYRXWlTrT+UcWCGyg3EawM2ZirtrAAB5Zo
	 6xEoPGIf/m/hG+gor1w8VBC4M83XBlSPuVlmrTqz09oVTR3OINqI7Wo1KdBo1d0auI
	 AwBa0Nvn22Pj75BYf8SclgsV/E/yL8PYLbp5/Bvb721bM4xMza0OzVGvwjfR+yedtI
	 CdGXt2f+7AZuYOnCpRGQd6jSUBpLXFxGQ9MBQXOEogEQPfcU7stOwM+1aEhqTa4rjO
	 2DM828rLtEJcQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c5eb6dfd3so6148242a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 19:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqbz0clWWy0a7Vdij6RffTKqy++aovbHWagcZdN2NRE+99eaAjVcjY2UCrLLj9Xu33E7sQS4U/q9j+tjL+kHIp9@vger.kernel.org
X-Gm-Message-State: AOJu0YxL4veAwN4CxZfO1qlWdSVJisxTk++QJP2Kg5TQfNePIPdav+Ms
	dUk8shJVzSgc1AshdakUid32ld1YQA6HRWE0V3LJmj78J8NjHRN+bXqK4tB4gwPIyqQ8LoSVGE0
	ikBsTB+Mfg4Fd2cvG1P7TNRzieaBXSQ==
X-Received: by 2002:a17:906:9c96:b0:c16:2750:fc56 with SMTP id
 a640c23a62f3a-c1667a76e98mr289795166b.41.1784082538444; Tue, 14 Jul 2026
 19:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
 <20260714214519.GA2851152-robh@kernel.org> <CADi83T6kdqo-x0bcCGspni_e6ysEY6sud1AmZ4-utveA0rpLQA@mail.gmail.com>
In-Reply-To: <CADi83T6kdqo-x0bcCGspni_e6ysEY6sud1AmZ4-utveA0rpLQA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 21:28:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
X-Gm-Features: AUfX_mzXuqLXie6CLWuLJ3TNxvl1OVaHyYiBnb4zldxw9L1dxTkVeP02-_OzU2s
Message-ID: <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-remoteproc@vger.kernel.org, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 5:50=E2=80=AFPM Alexandru Gagniuc <mr.nuke.me@gmail=
.com> wrote:
>
> Hi Rob
>
>
> On Tue, Jul 14, 2026, 17:45 Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
>> >
>> > On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
>> > > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wc=
ss
>> > > driver. This firmware is usually used to run ath11k firmware and ena=
ble
>> > > wifi with chips such as QCN5024.
>> > >
>> > > When submitting v1, I learned that the firmware can also be loaded b=
y
>> > > the trustzone firmware. Since TZ is not shipped with the kernel, it
>> > > makes sense to have the option of a native init sequence, as not all
>> > > devices come with the latest TZ firmware.
>> > >
>> > > [...]
>> >
>> > Applied, thanks!
>> >
>> > [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
>> >       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
>> > [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT sc=
hema
>> >       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
>> > [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
>> >       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7
>>
>> Why is a 6 month old patchset with reported errors being applied?
>> Anyways, linux-next is now broken. Please fix.
>
>
> I must have missed the error reports. Can you please point me in the righ=
t direction? I'll get on this ASAP.

"make dt_binding_check" on linux-next.

Rob
