Return-Path: <robh@kernel.org>
MIME-Version: 1.0
References: <20200416005549.9683-1-robh@kernel.org> <20200416124359.GB5785@ravnborg.org>
In-Reply-To: <20200416124359.GB5785@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Apr 2020 09:37:50 -0500
Message-ID: <CAL_JsqKYTRh-cgMQSD=DHS2aud9TnLjKepqd9z0F9Wj2oe=jDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Content-Type: text/plain; charset="UTF-8"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux I2C <linux-i2c@vger.kernel.org>, Linux HWMON List <linux-hwmon@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, Linux Input <linux-input@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>, linux-can@vger.kernel.org, netdev <netdev@vger.kernel.org>, PCI <linux-pci@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux PWM List <linux-pwm@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, linux-spi <linux-spi@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Apr 16, 2020 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Wed, Apr 15, 2020 at 07:55:48PM -0500, Rob Herring wrote:
> > Fix various inconsistencies in schema indentation. Most of these are
> > list indentation which should be 2 spaces more than the start of the
> > enclosing keyword. This doesn't matter functionally, but affects running
> > scripts which do transforms on the schema files.
>
> Are there any plans to improve the tooling so we get warnigns for this?

I've been experimenting with yamllint some. I haven't figured out how
to best integrate it in. Probably need to start with something minimal
and warning free for the tree and then add to it.

There's also yaml-format in the dtschema repo which just reads in and
writes out a yaml file using ruamel round trip yaml parser. That's
what I used here.

> Otherwise I am afraid we will see a lot of patches that gets this wrong.
>
> As a follow-up patch it would be good if example-schema.yaml
> could gain some comments about the correct indentions.

Sure, I can do that.

>
> Some comments in the following.
>
> > diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> > index 49e0362ddc11..b388c5aa7984 100644
> > --- a/Documentation/devicetree/bindings/arm/altera.yaml
> > +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> > @@ -13,8 +13,8 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > -        - altr,socfpga-cyclone5
> > -        - altr,socfpga-arria5
> > -        - altr,socfpga-arria10
> > +          - altr,socfpga-cyclone5
> > +          - altr,socfpga-arria5
> > +          - altr,socfpga-arria10
> >        - const: altr,socfpga
>
> So here "- enum" do not need the extra indent.
> Is it because this is not a list?

Right. Indentation is 2 more spaces than the parent keyword ignoring
any hyphen in the parent.

> > diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> > index 66213bd95e6e..6cc74523ebfd 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> > @@ -25,7 +25,7 @@ select:
> >
> >  properties:
> >    compatible:
> > -   items:
> > +    items:
> >        - const: amlogic,meson-gx-ao-secure
> >        - const: syscon
>
> This is something I had expected the tooling to notice.
> I had expected the two "- const" to be indented with 4 spaces, not two.
> So there is something I do not understand.

As above, correct indenting is 2 spaces from the parent not counting
any '-' in the parent, but the '-' counts for indenting the children.

Arguably, this style is inconsistent that sometimes the '-' counts and
sometimes it doesn't. However, I think this style is better because it
distinguishes lists vs. dicts more clearly. It's easy to miss the '-'
when the indentation is the same:

- foo:
  - bar
  - baz

- foo:
    bar
    baz

Or worse:

- foo:
  - bar
    baz

Both styles are valid. It's just a tabs vs. spaces debate, and I just
picked one.


> > diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > index 07f39d3eee7e..f7f024910e71 100644
> > --- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > +++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
> > @@ -17,9 +17,8 @@ properties:
> >            - nxp,lpc3230
> >            - nxp,lpc3240
> >        - items:
> > -        - enum:
> > -            - ea,ea3250
> > -            - phytec,phy3250
> > -        - const: nxp,lpc3250
> > -
> > +          - enum:
> > +              - ea,ea3250
> > +              - phytec,phy3250
> > +          - const: nxp,lpc3250
> >  ...
>
> And here "- enum" receive extra indent.
>
> I trust you know what you are doing - but I do not get it.
>
> Some pointers or examples for the correct indention would be great.

With this patch, the tree is all correct examples. :)

> I cannot review this patch as long as I do not know the rules.
>
> My request to update example-schema.yaml was one way to teach me.
> (Some people will say that is difficult/impossible to teach me,
> but thats another story:-) ).
>
>         Sam
