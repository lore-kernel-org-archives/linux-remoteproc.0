Return-Path: <baolin.wang@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20171114150307.4k5kh7ggbrbpj76o@sirena.org.uk>
References: <2d10549b83f8b4990af60a61b44514b47da4c287.1509777293.git.baolin.wang@linaro.org>
 <CAMz4kuKeqOH7m0zx7=rmaBOg5eekw3RZZwsREOJCC0sVotG40g@mail.gmail.com> <20171114150307.4k5kh7ggbrbpj76o@sirena.org.uk>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Wed, 15 Nov 2017 10:07:34 +0800
Message-ID: <CAMz4ku+G91yZisM5zZEthXxLu2ruVivxNZgeP3N3LQ8tGTFs7A@mail.gmail.com>
Subject: Re: [PATCH] hwspinlock: Change hwspinlock to a bool
Content-Type: text/plain; charset="UTF-8"
To: Mark Brown <broonie@kernel.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 14 November 2017 at 23:03, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Nov 14, 2017 at 08:58:18PM +0800, Baolin Wang wrote:
>> On 4 November 2017 at 14:37, Baolin Wang <baolin.wang@linaro.org> wrote:
>> > Change hwspinlock to a bool in case some drivers will meet dependency
>> > issue when hwspinlock is built as a module.
>> >
>> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>
>> Could you apply this patch into K4.15 if there are no other comments? Thanks.
>
> It's in -next already as commit d048236dfdfe454f059a0837431c3ae3d166d4d6
> so it ought to get sent during the merge window.

Ah, OK. Thanks Mark.

-- 
Baolin.wang
Best Regards
