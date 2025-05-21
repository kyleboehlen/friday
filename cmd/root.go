/*
Copyright © 2025 Kyle Boehlen <kyleboehlen@gmail.com>
*/
package cmd

import (
	"github.com/spf13/cobra"
	"os"
)

// rootCmd represents the base command when called without any subcommands
var (
	// Flag vars
	//cfgFile string
	rootCmd = &cobra.Command{
		Use:   "friday",
		Short: "Kyle's custom CLI tooling.",
		Long: `Friday is a custom CLI tooling that does a little bit of anything and everything.

Docker container orchestration? Check.
CI/CD? Check.
Pulls you a shot of espresso? Oh, uh.. no. No it doesn't do that.

It's just a single place to store a whole lot of commands that make my life easier okay?`,
		//Run: func(cmd *cobra.Command, args []string) {},
	}
)

// Execute adds all child commands to the root command and sets flags appropriately.
// This is called by main.main(). It only needs to happen once to the rootCmd.
func Execute() {
	err := rootCmd.Execute()
	if err != nil {
		os.Exit(1)
	}
}

func init() {
	// Persistent flags
	//rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "", "config file (default is $HOME/.friday.yaml)")

	// Local flags
	// rootCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
